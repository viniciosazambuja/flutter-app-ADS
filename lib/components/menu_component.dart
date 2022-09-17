import 'package:calculadora_imc/pages/calculadora_page.dart';

import '../pages/about_page.dart';
import '../pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Menu(BuildContext context)
{
  return Drawer(
      child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              margin: EdgeInsets.only(bottom: 10.0),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,

                        image:
                        NetworkImage("https://www.pngall.com/wp-content/uploads/5/Profile-PNG-File.png"))),
              ),
              accountName: new Container(
                  child: Text(
                    'Vinicios',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              accountEmail: new Container(
                  child: Text(
                    'vinicios.pazambuja@gmail.com',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            ListTile(
              title: const Text('Calculadora IMC'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(title: 'Calculadora IMC'))
                );
              },
            ),
            ListTile(
              title: const Text('Calculadora Simples'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalculadoraPage(title: 'Calculadora'))
                );
              },
            ),
            ListTile(
              title: const Text('Sobre'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage(title: 'Sobre'))
                );
              },
            ),
          ]
      )
  );
}