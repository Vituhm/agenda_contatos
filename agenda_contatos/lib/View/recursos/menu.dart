import 'package:agenda_contatos/View/busca.dart';
import 'package:agenda_contatos/View/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuDrawer extends StatelessWidget{
  
  // Dados vindos do BD
  final String usuario = "Vitor Martins";
  final String email = "xxx@xmail.com";
  final String fotoPerfil = "img/perfil.png";

  Text mostrarTitulo(String texto) {
    return Text(
      texto,
      style: TextStyle(
        fontSize: 18,
      ),
    );
  } 
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Foto/Info do usuário
          UserAccountsDrawerHeader(
            accountName: Text(usuario),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(fotoPerfil),
              ),
            ),
          ),

          // Home
          ListTile(
            title: mostrarTitulo("Home"),
            subtitle: Text("Página Inicial"),
            trailing: FaIcon(FontAwesomeIcons.chevronRight),
            leading: FaIcon(
              FontAwesomeIcons.house,
              color: Colors.orange.shade400,
              size: 32,
            ),

            onTap: () { // Direciona a Homepage
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
          ),

          // Contatos
          ListTile(
            title: mostrarTitulo("Contatos"),
            subtitle: Text("Gerenciar contatos"),
            trailing: FaIcon(FontAwesomeIcons.chevronRight),
            leading: FaIcon(
              FontAwesomeIcons.userGroup,
              color: Colors.blue.shade400,
              size: 32,
            ),

            onTap: () { // Direciona a página de busca de contatos
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Busca(),
                ),
              );
            },
          ),

          // Perfil
          ListTile(
            title: mostrarTitulo("Perfil"),
            subtitle: Text("Editar Informações"),
            trailing: FaIcon(FontAwesomeIcons.chevronRight),
            leading: FaIcon(
              FontAwesomeIcons.addressCard,
              color: Colors.yellow.shade400,
              size: 32,
            ),

            onTap: () { // Direciona a página de configurações do perfil
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Home(), // Perfil
                ),
              );
            },
          ),

          // Configurações
          ListTile(
            title: mostrarTitulo("Configurações"),
            subtitle: Text("data"),
            trailing: FaIcon(FontAwesomeIcons.chevronRight),
            leading: FaIcon(
              FontAwesomeIcons.gears,
              color: Colors.teal.shade400,
              size: 32,
            ),

            onTap: () { // Direciona a página de configurações
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Home(), // Configurações
                ),
              );
            },
          ),

          // Logout
          ListTile(
            title: mostrarTitulo("Logoff"),
            subtitle: Text("Sair da conta"),
            trailing: FaIcon(FontAwesomeIcons.chevronRight),
            leading: FaIcon(
              FontAwesomeIcons.arrowRightFromBracket,
              color: Colors.red.shade400,
              size: 32,
            ),

            onTap: () { // Direciona a página de login
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home() // 
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}