import 'package:agenda_contatos/Model/contato.dart';
import 'package:agenda_contatos/Model/contatoService.dart';
import 'package:agenda_contatos/View/cadastro.dart';
import 'package:agenda_contatos/View/perfil.dart';
import 'package:agenda_contatos/View/recursos/barraSuperior.dart';
import 'package:agenda_contatos/View/recursos/menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Busca extends StatefulWidget {
  @override
  State createState() => BuscaState();     
}

class BuscaState extends State<Busca> {
  // Objeto de Model
  ContatoService service = ContatoService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Barrasuperior(),
      drawer: MenuDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 75),
        itemCount: service.listarContato().length, // Numero de itens na lista
        itemBuilder: (BuildContext context, int index) {
          // Guarda o retorno da lista no objeto da classe
          Contato contato = service.listarContato().elementAt(index);
          
          return Container(
            color: Colors.grey.shade800,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Foto (miniatura)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      contato.foto,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Nome e Fone
                  Column(
                    children: [
                      Text(
                        contato.nome + " " + contato.sobrenome,
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 24,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        contato.fone,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 15),
                ],
              ),

              trailing: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.grey.shade400,
                  size: 32,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Perfil(id: contato.id),
                    ),
                  );
                },
              ),
            ),
          );
        }
      ),

      // Botão flutuante (cadastrar)
      floatingActionButton: FloatingActionButton(
        child: FaIcon(
          FontAwesomeIcons.plus,
          size: 32,
        ),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cadastro()), // tela de cadastro
          );
        }
      ),
    );
  }
}