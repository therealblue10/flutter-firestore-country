import 'package:country/module/country/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country/module/country/country_widgets.dart' as PageWidget;


class CountryPage extends StatelessWidget {

  final india = Country.map({
    "name": "India",
    "population": "1.3B",
    "gdp": "5T",
    "head": "Narendra Modi"
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          PageWidget.AppBar(
            title: 'Countries',
            backgroundImagePath: 'assets/images/world-map-abstract.jpg',
          ),
          SliverSafeArea(
            top: false,
            sliver: SliverPadding(
              padding: EdgeInsets.only(top: 5),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return InkWell(
                        child: PageWidget.CountryListItem(
                          country: india,
                        ),
                      );
                    },
                  childCount: 1
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}