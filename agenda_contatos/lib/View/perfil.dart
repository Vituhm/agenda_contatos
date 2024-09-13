import 'package:agenda_contatos/Model/contato.dart';
import 'package:agenda_contatos/Model/contatoService.dart';
import 'package:agenda_contatos/View/recursos/barraSuperior.dart';
import 'package:agenda_contatos/View/recursos/menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Perfil extends StatelessWidget {
  // Guarda o ID do usuário selecionado
  final int id;

  // Construtor com o Atributo obrigatorio
  Perfil({required this.id});

  // Objeto da classe que contem a dos contatos
  final ContatoService service = ContatoService();

  @override
  Widget build(BuildContext context) {
    // Objeto da classe Contato
    Contato contato = service.listarContato().elementAt(id -1);
    
    return Scaffold(
      // Barra de Titulo
      appBar: Barrasuperior(),

      // Menu hamburguer
      drawer: MenuDrawer(),

      // Corpo do app
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            // Foto
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  contato.foto,
                  height: 350,
                )
              ],
            ),

            SizedBox(height: 25),

            // Nome

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  contato.nome + " " + contato.sobrenome,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    letterSpacing: 3,
                    wordSpacing: 3,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            // Fone e Email

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Fone
                Text(
                  contato.fone,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 18,
                  ),
                ),

                // Email
                Text(
                  contato.email,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 18,
                  ),
                ),
              ]
            ),

            Container(
              padding: EdgeInsets.only(top: 25, bottom: 25),
              child: Divider(height: 25),
            ),

            // Ações
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Ligar
                Column(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.phone,
                      color: Colors.orange.shade400,
                      size: 28,
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Ligar",
                      style: TextStyle(
                        color: Colors.orange.shade400,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),

                // Mensagem
                Column(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidComment,
                      color: Colors.orange.shade400,
                      size: 28,
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Mensagem",
                      style: TextStyle(
                        color: Colors.orange.shade400,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),

                // Video
                Column(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.video,
                      color: Colors.orange.shade400,
                      size: 28,
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Video",
                      style: TextStyle(
                        color: Colors.orange.shade400,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),

                // Emai
                Column(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidEnvelope,
                      color: Colors.orange.shade400,
                      size: 28,
                    ),

                    SizedBox(height: 10),

                    Text(
                      "E-mail",
                      style: TextStyle(
                        color: Colors.orange.shade400,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),

      // Botão flutuante ()
      floatingActionButton: FloatingActionButton(
        child: FaIcon(FontAwesomeIcons.pen),
        onPressed: () {
          //
        }
      ),
    );
  }
}