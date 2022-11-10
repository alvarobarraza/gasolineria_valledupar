class Gasoline {
  final String nit;
  final String nombre;
  final String telefono;
  final String user;
  final String pass;
  final String direccion;
  final String foto;
  final String acpm;
  final String corriente;
  final String extra;
  final String gas;
  final String estado;
  final String aprobacion;
  final String idRol;

  Gasoline({
    this.nit,
    this.nombre,
    this.telefono,
    this.user,
    this.pass,
    this.direccion,
    this.foto,
    this.acpm,
    this.corriente,
    this.extra,
    this.gas,
    this.estado,
    this.aprobacion,
    this.idRol
  });

  factory Gasoline.fromJson(Map<String, dynamic> json) {
    return Gasoline(
      nit: json['nit'],
      nombre: json['nombre'],
      telefono: json['telefono'],
      user: json['user'],
      pass: json['pass'],
      direccion: json['direccion'],
      foto: json['foto'],
      acpm: json['acpm'],
      corriente: json['corriente'],
      extra: json['extra'],
      gas: json['gas'],
      estado: json['estado'],
      aprobacion: json['aprobacion'],
      idRol: json['idRol']
    );
  }
}
