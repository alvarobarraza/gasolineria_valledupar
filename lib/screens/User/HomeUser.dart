import 'package:flutter/material.dart';
import 'package:gasolinera_valledupar/components/constants.dart';

class HomeUser extends StatefulWidget {
  @override
  _HomeUserState createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () { Navigator.pop(context);},
          child: Text(
            "BIENVENIDO USUARIO",
            style: TextStyle(color: kblue, fontSize: 20),
          ),
        ),
      ),
    );
  }

}