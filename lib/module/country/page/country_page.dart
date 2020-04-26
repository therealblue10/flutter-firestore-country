import 'package:country/auth/auth_store.dart';
import 'package:country/module/country/store/country.dart';
import 'package:country/module/country/store/country_store.dart';
import 'package:flutter/material.dart';
import 'package:country/module/country/widget/country_widgets.dart' as PageWidget;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';


class CountryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthStore>(context);
    authProvider.authenticateUser();

    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            PageWidget.AppBar(
              title: 'Countries',
              backgroundImagePath: 'assets/images/world-map-abstract.jpg',
            ),

            Observer(
              builder: (context) {
                if (authProvider.isAuthenticated) {
                  // Logged in successfully, Let's fetch country data
                  // Add Stream builder to fetch documents.
                  print('User authenticated');
                  return buildFirestoreCollectionStream(context);
                }
                else {
                  // Waiting to be logged in (Check network failure.
                  // Here we have handled only happy path )
                  return PageWidget.LinearIndicator();
                }
              },
            )
          ],
        ),
      );
  }

  Widget buildFirestoreCollectionStream(BuildContext context) {

    // Fetch countries
    final countryListProvider = Provider.of<CountryStore>(context);
    countryListProvider.fetchCountries();

    return Observer(
        builder: (context) {
          print('Countries: ${countryListProvider.countries}');
          if (countryListProvider.countries.length > 0) {
            return buildCountryList(countryListProvider.countries);
          }
          else {
            // Waiting to fetch data from Firestore
            return PageWidget.LinearIndicator();
          }
        },
      );
  }


  Widget buildCountryList(List<Country> countries) {
    return SliverSafeArea(
      top: false,
      sliver: SliverPadding(
        padding: EdgeInsets.only(top: 5),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return InkWell(
                  onTap: showCountryDetail,
                  child: PageWidget.CountryListItem(
                    country: countries[index],
                  ),
                );
              },
              childCount: countries.length
          ),
        ),
      ),
    );
  }

  void showCountryDetail() {
    // Open country detail page here
  }
}