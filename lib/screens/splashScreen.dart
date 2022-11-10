import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gasolinera_valledupar/components/constants.dart';
import 'package:gasolinera_valledupar/screens/Admin/homeAdmin.dart';

import 'login/loginScreen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 2000),(){
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [kPrimaryColor, kPrimaryLightColor2],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
        ),
        child: Center(
          child: Image.asset("assets/icons/bombaicono2.png" ,scale: 1.7,),
        ),
      ),
    );
  }
}
