import 'package:country/auth/auth_bloc.dart';
import 'package:country/module/country/country_bloc.dart';
import 'package:country/module/country/country_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CountryBloc()),
      ChangeNotifierProvider(create: (_) => AuthBloc()),
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
