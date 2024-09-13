import 'package:agenda_contatos/View/busca.dart';
import 'package:agenda_contatos/View/cadastro.dart';
import 'package:agenda_contatos/View/recursos/barraSuperior.dart';
import 'package:agenda_contatos/View/recursos/menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget{
  @override
  State createState() => HomeState();
}

class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // // Titulo do app
      appBar: Barrasuperior(),
      // // Menu
      drawer: MenuDrawer(),

      // // Corpo do app
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(25, 50, 25, 25),       
              child: Column(
                children: [
                  // Titulo
                  Text(
                    "Hello there!",
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 24,
                    ),
                  ),

                  SizedBox(height: 45), // Espaçamento

                  // Botão Buscar Contato
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        child: Container(
                          width: 300,
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.magnifyingGlass,
                                color: Colors.white,
                              ),

                              Text(
                                "Buscar Contatos",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              )
                            ],
                          ),
                        ),

                        style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.orange.shade800,
                        ),

                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Busca()), // Buscar
                          );
                        },
                      );
                    }
                  ),

                  SizedBox(height: 15), // Espaçamento
                  
                  // Botão Cadastrar Contato
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        child: Container(
                          width: 300,
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              Text(
                                "Cadastrar Contato",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              )
                            ],
                          ),
                        ),

                        style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.orange,
                        ),

                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Cadastro()), // tela de cadastro
                          );
                        },
                      );
                    }
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}