
import 'package:http/http.dart' as http;

void adicionarUsuario(String idUsuario, String nombre, String telefono, String email, String pass, String idRol) async {
  var url = Uri.parse(
      "https://edapgasoline.000webhostapp.com/adicionarUsuario.php");

  await http.post(url, body: {
    'idUsuario': idUsuario,
    'nombre': nombre,
    'telefono': telefono,
    'email': email,
    'pass': pass,
    'idRol': idRol
  });
}