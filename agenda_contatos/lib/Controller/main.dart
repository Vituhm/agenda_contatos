import 'package:agenda_contatos/View/home.dart';
import 'package:agenda_contatos/View/recursos/estilo.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: "Agenda de Contatos",
    home: Home(),
    debugShowCheckedModeBanner: false,
    theme: estilo(),
  )
);