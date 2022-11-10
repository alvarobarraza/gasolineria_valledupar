import 'package:flutter/material.dart';
import 'package:gasolinera_valledupar/components/constants.dart';
import 'package:gasolinera_valledupar/components/drawerScreen.dart';
import 'package:gasolinera_valledupar/models/gasoline.dart';
import 'package:gasolinera_valledupar/request/gasolineraHttps.dart';
import 'package:http/http.dart' as http;

class HomeAdmin extends StatefulWidget {
  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    // IconButton(
                    //   onPressed: () {

                    //   },
                    //   icon: SvgPicture.asset("assets/icons/menu.svg",
                    //       color: kPrimaryColor),
                    // ),
                    centerTitle: true,
                    title: Image.asset(
                      "assets/icons/bombaicono2.png",
                      fit: BoxFit.cover,
                      scale: 4,
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.refresh, color: Colors.blue,),
                        onPressed: () {
                          setState(() {
                            getInfo(context);
                          });
                        },
                        tooltip: 'Refrescar',
                      )
                    ],
                  ),
                  body: SafeArea(
                    child: Container(
                      child: getInfo(context),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

Widget getInfo(BuildContext context) {
  return FutureBuilder(
    future: listarGasolinerias(http.Client()),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.done:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          // print(snapshot.data);
          return snapshot.data != null
              ? ListGasoline(gasoline: snapshot.data)
              : Text('Sin Datos');

        default:
          return Text('Presiona el boton para recargar');
      }
    },
  );
}

class ListGasoline extends StatelessWidget {
  /*final List<Gasoline>gasoline = [
    Gasoline(
      id: "1",
      nombre: "gasolina 1",
      foto: "https://easygasgroup.com/wp-content/uploads/2020/02/A_opt.jpg",
      direcion: "s",
      telefono: "32022",
      acpm: "2000",
      corriente: "2000",
      estado: "Abierto",
      extra: "2000",
      gas: "2000"
    ),
    Gasoline(
        id: "2",
        nombre: "gasolina 2",
        foto: "https://easygasgroup.com/wp-content/uploads/2020/02/A_opt.jpg",
        direcion: "s",
        telefono: "32022",
        acpm: "2000",
        corriente: "2000",
        estado: "Abierto",
        extra: "2000",
        gas: "2000"
    ),
    Gasoline(
        id: "3",
        nombre: "gasolina 3",
        foto: "https://easygasgroup.com/wp-content/uploads/2020/02/A_opt.jpg",
        direcion: "s",
        telefono: "32022",
        acpm: "2000",
        corriente: "2000",
        estado: "Cerrado",
        extra: "2000",
        gas: "2000"
    ),
    Gasoline(
        id: "4",
        nombre: "gasolina 4",
        foto: "https://easygasgroup.com/wp-content/uploads/2020/02/A_opt.jpg",
        direcion: "s",
        telefono: "32022",
        acpm: "2000",
        corriente: "2000",
        estado: "Cerrado",
        extra: "2000",
        gas: "2000"
    ),
    Gasoline(
        id: "5",
        nombre: "gasolina 5",
        foto: "https://easygasgroup.com/wp-content/uploads/2020/02/A_opt.jpg",
        direcion: "s",
        telefono: "32022",
        acpm: "2000",
        corriente: "2000",
        estado: "Abierto",
        extra: "2000",
        gas: "2000"
    )
  ];*/

  //ListGasoline({Key key, this.gasoline}) : super(key: key);
  final List<Gasoline> gasoline;

  const ListGasoline({Key key, this.gasoline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gasoline.length,
      itemBuilder: (context, position) {
        return ListTile(
          onLongPress: (){
            confirmaeliminar(context, gasoline[position].nit);
          },
          leading: Container(
            padding: EdgeInsets.all(5.0),
            width: 80,
            height: 80,
            child: Image.network(gasoline[position].foto),
          ),
          title: Text(gasoline[position].nombre),
          subtitle: Text(
            gasoline[position].aprobacion == '1'
                ? "Aprobado"
                : "Pediente de aprobacion",
          ),
          trailing: Container(
            width: 100,
            height: 40,
            color: (gasoline[position].estado == '1'
                ? Colors.greenAccent
                : Colors.redAccent),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child:
                Text(gasoline[position].estado == '1' ? "Abierto" : "Cerrado"),
          ),
        );
      },
    );
  }
}

void confirmaeliminar(context, ideliminar) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text('Realmente Desea Eliminar?'),
        actions: <Widget>[
          ElevatedButton(
            child: Icon(Icons.cancel),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
            child: Icon(Icons.check_circle),
            onPressed: () {
              eliminarGasolineria(ideliminar);
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
