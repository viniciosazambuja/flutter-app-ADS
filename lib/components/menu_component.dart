import 'package:calculadora_imc/pages/calculadora_page.dart';

import '../pages/about_page.dart';
import '../pages/calculdadora_ios_page.dart';
import '../pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Menu(BuildContext context){
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
                        NetworkImage("https://pps.whatsapp.net/v/t61.24694-24/297740414_449257080415491_1331139987998636378_n.jpg?ccb=11-4&oh=01_AVzjmUOqCaUzK8ScTejEkrA22C1_BmeignsgBPSvUKfikQ&oe=634884BA"))),
              ),
              accountName: new Container(
                  child: Text(
                    'Vinicios Azambuja',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              accountEmail: new Container(
                  child: Text(
                    'vinicios.pazambuja@gmail.com',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            ListTile(
              title: Text("Calculadora IMC"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(title: 'Calculadora IMC')),);
              },
            ),
            ListTile(
              title: Text("Calculadora"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculadoraPage(title: 'Calculadora')),);
              },
            ),
            ListTile(
              title: Text("Calculadora IOS"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculadoraIOSPage(title: 'Calculadora IOS')),);
              },
            ),
            ListTile(
              title: Text("Sobre"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage(title: 'Sobre')),);
              },
            ),
          ]
      )
  );
}