import 'package:country/auth/auth_store.dart';
import 'package:country/module/country/page/country_page.dart';
import 'package:country/module/country/store/country_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      Provider<AuthStore>(create: (_) => AuthStore()),
      Provider<CountryStore>(create: (_) => CountryStore())
    ],
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: CountryPage(),
    );
  }
}
