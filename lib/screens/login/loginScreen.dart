import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gasolinera_valledupar/components/constants.dart';
import 'package:gasolinera_valledupar/components/roundedButtom.dart';
import 'package:gasolinera_valledupar/screens/Admin/homeAdmin.dart';
import 'package:gasolinera_valledupar/screens/Gasolineria/HomeGasolineria.dart';
import 'package:gasolinera_valledupar/screens/User/HomeUser.dart';
import 'package:gasolinera_valledupar/screens/login/RegisterGasolinera.dart';
import 'package:gasolinera_valledupar/screens/login/registerScreen.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String msg = '';
  String username = '';
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  Future<List> login() async {
    final response = await http.post(
        Uri.parse("https://edapgasoline.000webhostapp.com/login.php"),
        body: {
          "email": controllerUser.text,
          "pass": controllerPass.text,
        });

    var datauser = json.decode(response.body);
    print(datauser);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    } else {
      if (datauser[0]['idRol'] == '1') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeAdmin()));
      } else if (datauser[0]['idRol'] == '2') {
        //Navigator.pushReplacementNamed(context, 'crud');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeUser()));
      }else if (datauser[0]['idRol'] == '3'){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeGasolineria()));
      }

      setState(() {
        username = datauser[0]['email'];
      });
    }

    return datauser;
  }

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Form(
            key: _formKey,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          "Iniciar sesión",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Image.asset(
                        "assets/icons/bombaicono2.png",
                        scale: 3,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      "Usuario",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        controller: controllerUser,
                        decoration: InputDecoration(
                            hintText: "ejemplo@gmail.com",
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Necesario el Usuario';
                          }
                          return null;
                        },
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      "Contraseña",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        controller: controllerPass,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                            hintText: "***********",
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            suffixIcon: _obscureText
                                ? IconButton(
                                    icon: Icon(Icons.visibility),
                                    color: Colors.white,
                                    onPressed: _toggle,
                                  )
                                : IconButton(
                                    icon: Icon(Icons.visibility_off),
                                    color: Colors.white,
                                    onPressed: _toggle,
                                  )),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Necesario la contraseña';
                          }
                          return null;
                        },
                      )),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: RoundedButton(
                        text: "Ingresar",
                        textColor: Colors.white,
                        press: () {
                          if (_formKey.currentState.validate()) {
                            login();
                          }
                        }),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Text(
                        "¿No tienes usuario?, Crea uno",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterGasolinera()));
                      },
                      child: Text(
                        "Crea una gasolineria",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
        ));
  }
}
