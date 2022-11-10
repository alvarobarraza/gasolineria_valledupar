
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:gasolinera_valledupar/models/gasoline.dart';
import 'dart:convert';


Future<List<Gasoline>> listarGasolinerias(http.Client client) async {

  final response = await http.get(Uri.parse(
      'https://edapgasoline.000webhostapp.com/listarGasolineras.php'));

  return compute(pasaraListas, response.body);
}

// Una función que convierte el body de la respuesta en un List<Photo>
List<Gasoline> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Gasoline>((json) => Gasoline.fromJson(json)).toList();
}

void AddGasolinera(
    String nit,
    String nombre,
    String telefono,
    String user,
    String pass,
    String direccion,
    String foto,
    String acpm,
    String corriente,
    String extra,
    String gas,
    String estado,
    String aprobacion,
    String idRol
    ) async {
  var url = Uri.parse(
      "https://edapgasoline.000webhostapp.com/addGasolinera.php");

  await http.post(url, body: {
    'nit': nit,
    'nombre': nombre,
    'telefono': telefono,
    'user': user,
    'pass': pass,
    'direccion': direccion,
    'foto': foto,
    'acpm': acpm,
    'corriente': corriente,
    'extra': extra,
    'gas': gas,
    'estado': estado,
    'aprobacion': aprobacion,
    'idRol': idRol,
  });
}

void eliminarGasolineria(nit) async {
  var url = Uri.parse(
      "https://edapgasoline.000webhostapp.com/eliminarGasolinera.php");

  await http.post(url, body: {
    'nit': nit,
  });
}