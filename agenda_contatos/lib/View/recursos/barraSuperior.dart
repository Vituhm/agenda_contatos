import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Barrasuperior extends AppBar {
  Barrasuperior() : super(
    automaticallyImplyLeading: false, // Esconde o icone original do Menu
    centerTitle: true,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: FaIcon(
            FontAwesomeIcons.bars,
          ),
          // Abre o Menu
          onPressed: () => Scaffold.of(context).openDrawer()
        );
      }
    ),
    // Titulo
    title: Text(
      "Agenda de Contatos",
      style: TextStyle(
        color: Colors.orange.shade400,
        fontSize: 28,
      ),
    ),
    // Menu (icone)
    iconTheme: IconThemeData(
      color: Colors.orange.shade400,
      
    ),
  );
}