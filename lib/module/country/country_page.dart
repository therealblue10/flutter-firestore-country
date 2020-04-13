import 'package:country/module/country/country.dart';
import 'package:country/service/firebase/firebase_auth_service.dart';
import 'package:country/service/firebase/firestore_cloud_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country/module/country/country_widgets.dart' as PageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';


class CountryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  
  final _firebaseAuthService = FirebaseAuthService();
  final _firestoreService  = FirestoreService();

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            PageWidget.AppBar(
              title: 'Countries',
              backgroundImagePath: 'assets/images/world-map-abstract.jpg',
            ),
            FutureBuilder(
              future: _firebaseAuthService.authenticateUser(),
              builder: (BuildContext context,
                  AsyncSnapshot<FirebaseUser> snapshot) {
                if (snapshot.hasData) {
                  // Logged in successfully, Let's fetch country data
                  // Add Stream builder to fetch documents.
                  return buildFirestoreCollectionStream();
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

  StreamBuilder<QuerySnapshot> buildFirestoreCollectionStream() =>
      StreamBuilder<QuerySnapshot>(
        stream: _firestoreService.getCountrySnapshot(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final countries = snapshot.data.documents.map((document) =>
                Country.map(document.data));
            return buildCountryList(countries.toList());
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


}