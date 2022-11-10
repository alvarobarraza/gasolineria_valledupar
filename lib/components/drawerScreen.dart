import 'package:flutter/material.dart';
import 'package:gasolinera_valledupar/screens/Admin/RegisterUserAdmin.dart';
import 'package:gasolinera_valledupar/screens/Admin/addGasolinera.dart';
import 'package:gasolinera_valledupar/screens/Admin/homeAdmin.dart';
import 'package:gasolinera_valledupar/screens/login/loginScreen.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'constants.dart';


class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final name = "Mister";
    return Container(
      color: kPrimaryColor,
      padding: EdgeInsets.only(top: 50, bottom: 10, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/avatar2.png"),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text("Administrador",
                    style: TextStyle(
                        color: Colors.white38, fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(width: 13),
          ]),
          SizedBox(
            height: 4,
          ),
          Column(
            children: [
              BuildMenuItems(
                text: "inicio",
                icon: LineAwesomeIcons.home,
                press: () => selectedItem(context, 0),
              ),
              SizedBox(
                height: 8,
              ),
              BuildMenuItems(
                  text: "Usuarios",
                  icon: Icons.person_add_alt_1_outlined,
                  press: () => selectedItem(context, 1)),
              SizedBox(
                height: 8,
              ),
              BuildMenuItems(
                  text: "Gasolinerias",
                  icon: Icons.local_gas_station,
                  press: () => selectedItem(context, 2)),
              SizedBox(
                height: 8,
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 8, bottom: 20),
            child: ListTile(
                leading: Icon(
                  LineAwesomeIcons.alternate_sign_out,
                  color: Colors.red[200],
                ),
                title: Text("Salir", style: TextStyle(color: Colors.red[200])),
                onTap: () => selectedItem(context, 3)),
          ),
        ],
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeAdmin()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RegisterUserAdmin()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AddGasolineraAdmin()));
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginScreen()));
        break;
    }
  }
}

class ItemDrawer extends StatelessWidget {
  final String texto;
  final IconData icon;
  final VoidCallback press;

  const ItemDrawer({
    this.texto,
    this.icon,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(texto, style: TextStyle(color: Colors.white)),
        onTap: press,
      ),
    );
  }
}

class BuildMenuItems extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback press;

  const BuildMenuItems(
      {this.text, this.icon, this.press});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(this.icon, color: Colors.white),
      title: Text(this.text, style: TextStyle(color: Colors.white)),
      hoverColor: Colors.white70,
      onTap: this.press,
    );
  }
}

class BuildHeader extends StatelessWidget {
  final String name;
  final String email;
  final VoidCallback press;

  const BuildHeader(
      {this.press, this.name, this.email});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.press,
      child: Row(
        children: [
          Spacer(),
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/images/perfilImage.jpg"),
          ),
          SizedBox(
            width: 20,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              this.name,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              this.email,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "ADMINISTRADOR",
              style: TextStyle(color: Colors.red[200], fontSize: 10),
            )
          ]),
          Spacer(),
        ],
      ),
    );
  }
}
