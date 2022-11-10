class User {
  final String idUsuario;
  final String nombre;
  final String telefono;
  final String email;
  final String password;

  User({
    this.idUsuario,
    this.nombre,
    this.telefono,
    this.email,
    this.password
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUsuario: json['idUsuario'],
      nombre: json['nombre'],
      telefono: json['telefono'],
      email: json['email'],
      password: json['password']
    );
  }
}