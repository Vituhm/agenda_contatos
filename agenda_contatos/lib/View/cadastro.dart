import 'package:agenda_contatos/Model/contato.dart';
import 'package:agenda_contatos/Model/contatoService.dart';
import 'package:agenda_contatos/View/busca.dart';
import 'package:agenda_contatos/View/recursos/barraSuperior.dart';
import 'package:agenda_contatos/View/recursos/menu.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget{
  @override
  State createState() => CadastroState();
}

class CadastroState extends State<Cadastro> {
  // Controladores dos campos input
  final nome = TextEditingController();
  final sobrenome = TextEditingController();
  final email = TextEditingController();
  final fone = TextEditingController();
  final foto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Barrasuperior(),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        //Formulario
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade800,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Titulo
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 15),
                child: Text(
                  "Cadastro de Contato",
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 24
                  ),
                ),
              ),

              // Inputs (campos do form)
              campoInput("Nome", nome),
              campoInput("Sobrenome", sobrenome),
              campoInput("E-mail", email),
              campoInput("Telefone", fone),
              campoInput("Foto", foto),

              SizedBox(height: 15),

              // Botões
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Botão Cadastrar
                  Builder(
                    builder: (BuildContext context){
                      return ElevatedButton(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          child: Text(
                            "Cadastrar",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange
                        ),
                        onPressed: () {
                          cadastrar();
                        },
                      );
                    }
                  ),

                  // Botão Limpar
                  Builder(
                    builder: (BuildContext context){
                      return ElevatedButton(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          child: Text(
                            "Limpar",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey
                        ),
                        onPressed: () {
                          limpar();
                        },
                      );
                    }
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // Retorna a estrutura do campo input
  Container campoInput(String nomeCampo, TextEditingController controlador){
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        // Atributo que recebe o valor do campo
        controller: controlador,
        decoration: InputDecoration(
          labelText: nomeCampo,
          labelStyle: TextStyle(
            color: Colors.grey.shade300,
            fontSize: 18,
          ),

          // Borda do input
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
        ),
      ),
    );
  }

  // Cadastrar
  void cadastrar(){
    ContatoService service = ContatoService();
    
    // Guardar o ultimo ID cadastrado
    int ultimoID = service.listarContato().length;

    Contato contato = Contato(
      id: ultimoID + 1,
      nome: nome.text,
      sobrenome: sobrenome.text,
      email: email.text,
      fone: fone.text,
      foto: foto.text
    );

    // Envia o objeto preenchido para adicionar na lista
    String mensagem = service.cadastrarContato(contato);

    // Mostra a mensagem com SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          mensagem,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade300,
          ),
        ),
        duration: Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.grey.shade800,
      )
    );
    // Redireciona para a tela de busca
    Future.delayed(
      Duration(milliseconds: 2500),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Busca())
        );
      }
    );
  }

  // Limpar campos
  void limpar(){
    this.nome.text = "";
    this.sobrenome.text = "";
    this.email.text = "";
    this.fone.text = "";
    this.foto.text = "";
  }
}