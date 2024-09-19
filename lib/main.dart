import 'package:flutter/material.dart';
import 'package:movies_app/detailsfilm.dart';
import 'package:movies_app/search.dart';
import 'package:movies_app/splash%20screen.dart';

import 'HomeScreen.dart';
import 'movies details.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //  home: HomeScreen(),
      home: Splashscreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),

        Detailsfilm.routeName:(context)=>Detailsfilm()
      },
    );

      }
  }