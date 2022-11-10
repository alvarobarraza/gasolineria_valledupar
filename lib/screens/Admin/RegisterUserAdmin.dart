import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gasolinera_valledupar/components/constants.dart';
import 'package:gasolinera_valledupar/components/drawerScreen.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class RegisterUserAdmin extends StatefulWidget {
  @override
  _RegisterUserAdminState createState() => _RegisterUserAdminState();
}

class _RegisterUserAdminState extends State<RegisterUserAdmin> {

  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerTelefono = TextEditingController();
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerId = TextEditingController();

  void adduser() {
    var url = "https://edapgasoline.000webhostapp.com/adicionarUsuario.php";

    http.post(url, body: {
      'idUsuario': controllerId.text,
      'nombre': controllerNombre.text,
      'telefono': controllerTelefono.text,
      'email': controllerUser.text,
      'pass': controllerPass.text,
      'idRol': "2"
    });
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      //backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          DrawerScreen(),
          AnimatedContainer(
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor)
              ..rotateY(isDrawerOpen ? -0.5 : 0),
            duration: Duration(milliseconds: 250),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(isDrawerOpen ? 0 : 0.0)),
            child: SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    leading: isDrawerOpen
                        ? IconButton(
                      icon: Icon(Icons.arrow_back_ios,
                          color: kPrimaryColor),
                      onPressed: () {
                        setState(() {
                          xOffset = 0;
                          yOffset = 0;
                          scaleFactor = 1;
                          isDrawerOpen = false;
                        });
                      },
                    )
                        : IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: kPrimaryColor,
                        ),
                        onPressed: () {
                          setState(() {
                            xOffset = 230;
                            yOffset = 150;
                            scaleFactor = 0.6;
                            isDrawerOpen = true;
                          });
                        }),

                    centerTitle: true,
                    title: Image.asset(
                      "assets/icons/bombaicono2.png",
                      fit: BoxFit.cover,
                      scale: 4,
                    ),
                    actions: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: size.width * 0.2,
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                            color: kblue,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              adduser();
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            "Hecho",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],

                  ),
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

                              LayoutBuilder(
                                builder: (context, constraints) {
                                  final radius = min(
                                      constraints.maxHeight / 5, constraints.maxWidth / 5);
                                  return Center(
                                    child: Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: radius,
                                          backgroundImage:
                                          AssetImage("assets/images/avatar2.png"),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 4,
                                          child: ClipOval(
                                            child: Container(
                                              padding: EdgeInsets.all(2),
                                              color: Colors.white,
                                              child: ClipOval(
                                                child: Container(
                                                  padding: EdgeInsets.all(1),
                                                  color: kblue,
                                                  child: IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        LineAwesomeIcons.cog,
                                                        size: 25,
                                                        color: Colors.white,
                                                      )),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Text(
                                  "Tu identificación",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: TextFormField(
                                    controller: controllerId,
                                    decoration: InputDecoration(
                                        hintText: "1002541265 por ejemplo",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.blue))),
                                    style: TextStyle(color: Colors.black),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Necesario la identificación';
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
                                  "Tu nombre",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: TextFormField(
                                    controller: controllerNombre,
                                    decoration: InputDecoration(
                                        hintText: "Carl Jhonson por ejemplo",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.blue))),
                                    style: TextStyle(color: Colors.black),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Necesario el Nombre';
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
                                  "Tu Telefono",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: TextFormField(
                                    controller: controllerTelefono,
                                    decoration: InputDecoration(
                                        hintText: "301548315 por ejemplo",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.blue))),
                                    style: TextStyle(color: Colors.black),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Necesario el Telefono';
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
                                  "Tu Email",
                                  style: TextStyle(
                                      color: Colors.blue,
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
                                            borderSide: BorderSide(color: Colors.blue))),
                                    style: TextStyle(color: Colors.black),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Necesario el Email';
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
                                      color: Colors.blue,
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
                                        hintText: "*********",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.blue)),
                                        suffixIcon: _obscureText
                                            ? IconButton(
                                          icon: Icon(Icons.visibility),
                                          color: Colors.blue,
                                          onPressed: _toggle,
                                        )
                                            : IconButton(
                                          icon: Icon(Icons.visibility_off),
                                          color: Colors.blue,
                                          onPressed: _toggle,
                                        )),
                                    style: TextStyle(color: Colors.black),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Necesario la contraseña';
                                      }
                                      return null;
                                    },
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
