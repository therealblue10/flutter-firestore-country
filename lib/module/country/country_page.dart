import 'package:country/auth/auth_bloc.dart';
import 'package:country/module/country/country.dart';
import 'package:country/module/country/country_bloc.dart';
import 'package:flutter/material.dart';
import 'package:country/module/country/country_widgets.dart' as PageWidget;
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
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            PageWidget.AppBar(
              title: 'Countries',
              backgroundImagePath: 'assets/images/world-map-abstract.jpg',
            ),
            StreamBuilder<bool>(
              stream:  Provider.of<AuthBloc>(context).subscribeToStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data) {
                  // Logged in successfully, Let's fetch country data
                  // Add Stream builder to fetch documents.
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

  Widget buildFirestoreCollectionStream(BuildContext context) =>
      StreamBuilder<List<Country>>(
        stream:  Provider.of<CountryBloc>(context).subscribeToStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildCountryList(snapshot.data);
          }
          else {
            // Waiting to fetch data from Firestore
            return PageWidget.LinearIndicator();
          }
        },
      );


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