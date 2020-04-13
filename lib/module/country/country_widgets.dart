import 'package:country/module/country/country.dart';
import 'package:flutter/material.dart';

/*Creates the App Bar for Country List*/
class AppBar extends StatelessWidget {
  AppBar({Key key, this.title, this.backgroundImagePath, this.maxHeight = 240})
      : super(key: key);

  final String title;
  final String backgroundImagePath;
  final double maxHeight;

  @override
  Widget build(BuildContext context) => SliverAppBar(
        stretch: true,
        pinned: true,
        expandedHeight: maxHeight,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(color: Colors.white, fontSize: 25),
          ),
          background: Image.asset(
            backgroundImagePath,
            fit: BoxFit.cover,
          ),
        ),
      );
}

class CountryListItem extends StatelessWidget {
  CountryListItem({Key key, @required this.country}) : super(key: key);

  final Country country;

  @override
  Widget build(BuildContext context) => Container(
      width: MediaQuery.of(context).size.width,
      height: 220,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 1,
          color: Colors.white70,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        country.name,
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontSize: 24, color: Colors.white),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Head of Country: ',
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(fontSize: 16, color: Colors.white70),
                          ),
                          Text(
                            country.head,
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 160,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.purple.withAlpha(60),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'Population',
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(fontSize: 16, color: Colors.black54),
                        ),
                        Text(
                          country.population,
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(fontSize: 24, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.indigo.withAlpha(60),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'GDP',
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(fontSize: 16, color: Colors.black54),
                        ),
                        Text(
                          country.gdp,
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(fontSize: 24, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
}

class LinearIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child: LinearProgressIndicator(),
  );

}
