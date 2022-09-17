import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/menu_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _imc = 0;
  String _textImc = '';

  final _inputControllerPeso = TextEditingController();
  final _inputControllerAltura = TextEditingController();
  List<String> _list = <String>[];

  void _setList() {
    _list.add(_textImc);
    _inputControllerPeso.clear();
    _inputControllerAltura.clear();

    setState(() {
      _list = _list;
    });
  }

  void _limpaLista() {
    _list.clear();

    setState(() {
      _list = _list;
    });
  }

  void _calculaIMC() {
    _imc = (double.parse(_inputControllerPeso.text) /
        pow(double.parse(_inputControllerAltura.text), 2));

    var _imcFormatado = _imc.toStringAsFixed(2);

    if (_imc <= 18.5) {
      _textImc = "Abaixo do peso ideal ($_imcFormatado)";
    } else if (_imc >= 18.5 && _imc < 24.9) {
      _textImc = "Dentro do peso ideal ($_imcFormatado)";
    } else if (_imc >= 25 && _imc < 29.9) {
      _textImc = "Está em sobrepeso ($_imcFormatado)";
    } else if (_imc >= 30 && _imc < 34.9) {
      _textImc = "Obesidade Grau I ($_imcFormatado)";
    } else if (_imc >= 35 && _imc < 39.9) {
      _textImc = "Obesidade Grau II ($_imcFormatado)";
    } else {
      _textImc = "Obesidade Mórbida ($_imcFormatado)";
    }

    _setList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title, textAlign: TextAlign.center),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.restart_alt,
              color: Colors.white,
            ),
            onPressed: _limpaLista,
          )
        ],
      ),
      drawer: Menu(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.balance,
                    size: 150,
                    color: Colors.blue,
                  ),
                ]),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Peso (kg)',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
                textAlign: TextAlign.center,
                controller: _inputControllerPeso,
                style: TextStyle(fontSize: 16)),
            SizedBox(
              height: 10,
            ),
            Text(
              'Altura (m)',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
                textAlign: TextAlign.center,
                controller: _inputControllerAltura,
                style: TextStyle(fontSize: 16)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: _calculaIMC,
                  child: Text('Calcular',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 500,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: _list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('${_list[index]}',style: TextStyle(fontSize: 16)),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            _list.removeAt(index);

                            setState(() {
                              _list = _list;
                            });
                          },
                        )
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
