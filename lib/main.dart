import 'package:flutter/material.dart';
import 'package:gasolinera_valledupar/components/constants.dart';
import 'package:gasolinera_valledupar/screens/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gasolineria Valledupar',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme:  AppBarTheme(
          color: Colors.white,
          elevation: 0
        )
      ),
      home: SplashScreen()
    );
  }
}


