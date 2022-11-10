import 'package:flutter/material.dart';
import 'package:gasolinera_valledupar/components/constants.dart';

class HomeGasolineria extends StatelessWidget {
  const HomeGasolineria({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () { Navigator.pop(context);},
          child: Text(
            "BIENVENIDO A GASOLINERIA",
            style: TextStyle(color: kblue, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
