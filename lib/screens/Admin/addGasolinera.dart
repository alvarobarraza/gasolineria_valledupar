import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gasolinera_valledupar/components/constants.dart';
import 'package:gasolinera_valledupar/components/drawerScreen.dart';
import 'package:gasolinera_valledupar/request/gasolineraHttps.dart';
import 'package:gasolinera_valledupar/request/userHttps.dart';
import 'package:gasolinera_valledupar/screens/Admin/homeAdmin.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class AddGasolineraAdmin extends StatefulWidget {
  @override
  _AddGasolineraAdminState createState() => _AddGasolineraAdminState();
}

class _AddGasolineraAdminState extends State<AddGasolineraAdmin> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerNit = TextEditingController();
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerFoto = TextEditingController();
  TextEditingController controllerDireccion = TextEditingController();
  TextEditingController controllerTelefono = TextEditingController();
  TextEditingController controllerEstado = TextEditingController();
  TextEditingController controllerAcpm = TextEditingController();
  TextEditingController controllerCorriente = TextEditingController();
  TextEditingController controllerExtra = TextEditingController();
  TextEditingController controllerGas = TextEditingController();
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  bool estado = false;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  void adduser() {
    var url = "https://edapgasoline.000webhostapp.com/adicionarUsuario.php";

    http.post(url, body: {
      'idUsuario': controllerNit.text,
      'nombre': controllerNombre.text,
      'telefono': controllerTelefono.text,
      'email': controllerUser.text,
      'pass': controllerPass.text,
      'idRol': "3"
    });
  }

  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;

    void _toggle() {
      setState(() {
        _obscureText = !_obscureText;
      });
    }

    Size size = MediaQuery.of(context).size;

    return Scaffold(
        //backgroundColor: Colors.white,
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
                        icon: Icon(Icons.arrow_back_ios, color: kPrimaryColor),
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
                    width: size.width * 0.15,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                        color: kblue, borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        //Navigator.pop(context);
                        if (_formKey.currentState.validate()) {
                          //formulario bien
                          String estadotxt = "0";

                          estado == true ? estadotxt = "1" : estadotxt = "0";

                          AddGasolinera(
                            controllerNit.text,
                            controllerNombre.text,
                            controllerTelefono.text,
                            controllerUser.text,
                            controllerPass.text,
                            controllerDireccion.text,
                            controllerFoto.text,
                            controllerAcpm.text,
                            controllerCorriente.text,
                            controllerExtra.text,
                            controllerGas.text,
                            estadotxt,
                            "1",
                            "3",
                          );
                          adduser();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeAdmin()));
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
                              final radius = min(constraints.maxHeight / 5,
                                  constraints.maxWidth / 5);
                              return Center(
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: radius,
                                      backgroundImage: AssetImage(
                                          "assets/images/gasolinera.jpg"),
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
                              "Nit",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: TextFormField(
                                controller: controllerNit,
                                decoration: InputDecoration(
                                    hintText: "1002541265 por ejemplo",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                                style: TextStyle(color: Colors.black),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Necesario el Nit';
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
                              "Nombre",
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
                                    hintText: "Gasolineria la 24",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
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
                              "Direccion",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: TextFormField(
                                controller: controllerDireccion,
                                decoration: InputDecoration(
                                    hintText: "calle 30 #24 por ejemplo",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.blue))),
                                style: TextStyle(color: Colors.black),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Necesario la direccion';
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
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
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
                              "Usuario",
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
                                    hintText: "Gasolineriala24 por ejemplo",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                                style: TextStyle(color: Colors.black),
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
                                    hintText: "************",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
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
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              "Url de la foto",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: TextFormField(
                                controller: controllerFoto,
                                decoration: InputDecoration(
                                    hintText: "https://fotoexample.jpg",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                                style: TextStyle(color: Colors.black),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Necesario la url de la foto';
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
                              "Acpm",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: TextFormField(
                                controller: controllerAcpm,
                                decoration: InputDecoration(
                                    hintText: "Valor del acpm",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                                style: TextStyle(color: Colors.black),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Necesario el Valor';
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
                              "Corriente",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: TextFormField(
                                controller: controllerCorriente,
                                decoration: InputDecoration(
                                    hintText: "Valor de corriente",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                                style: TextStyle(color: Colors.black),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Necesario el Valor';
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
                              "Extra",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: TextFormField(
                                controller: controllerExtra,
                                decoration: InputDecoration(
                                    hintText: "Valor de extra",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                                style: TextStyle(color: Colors.black),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Necesario el Valor';
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
                              "Gas",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: TextFormField(
                                controller: controllerGas,
                                decoration: InputDecoration(
                                    hintText: "Valor del gas",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                                style: TextStyle(color: Colors.black),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Necesario el Valor';
                                  }
                                  return null;
                                },
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: SwitchListTile(
                              title: Text(
                                'Estado',
                                style: TextStyle(color: Colors.blue),
                              ),
                              value: estado,
                              inactiveThumbColor: Colors.red,
                              onChanged: (bool value) {
                                setState(() {
                                  estado = value;
                                });
                              },
                            ),
                          ),
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
    ));
  }
}
