
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/menu_component.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  late double _num, _num2 = 0;
  String _resultado = '';



  final _inputControllerNum = TextEditingController();
  final _inputControllerNum2 = TextEditingController();

  List<String> _list =[];

  void _setList() {
    _list.add(_resultado);
    _inputControllerNum.clear();
    _inputControllerNum2.clear();

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

  void _diminuir(){

    _num = double.parse(_inputControllerNum.text);
    _num2 = double.parse(_inputControllerNum2.text);

    double resultadoDim = _num - _num2;
    _resultado = resultadoDim.toString();

    _setList();
  }

  void _somar(){

      _num = double.parse(_inputControllerNum.text);
      _num2 = double.parse(_inputControllerNum2.text);

      double resultadoSoma = _num + _num2;
      _resultado = resultadoSoma.toString();

      _setList();
  }

  void _multiplicar(){

    _num = double.parse(_inputControllerNum.text);
    _num2 = double.parse(_inputControllerNum2.text);

    double resultadoSoma = _num * _num2;
    _resultado = resultadoSoma.toString();

    _setList();
  }

  void _dividir(){

    _num = double.parse(_inputControllerNum.text);
    _num2 = double.parse(_inputControllerNum2.text);

    double resultadoSoma = _num / _num2;
    _resultado = resultadoSoma.toString();

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.calculate_outlined,
                      size: 150,
                      color: Colors.blue,
                    ),
                  ]),
              Text(
                'Primeiro número',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                  textAlign: TextAlign.center,
                  controller: _inputControllerNum,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 16)),
              Text(
                'Segundo número',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                  textAlign: TextAlign.center,
                  controller: _inputControllerNum2,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 16)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add,
                        size: 30,
                        color: Colors.blue,),
                      tooltip: 'Mais',
                      onPressed: () {
                        setState(() {
                          _somar();
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove,
                        size: 30,
                        color: Colors.blue,),
                      tooltip: 'Menos',
                      onPressed: () {
                        setState(() {
                          _diminuir();
                        });
                      },
                    ),
                    IconButton(
                      icon: Text("*",
                        style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold)),
                      tooltip: 'Vezes',
                      onPressed: () {
                        setState(() {
                          _multiplicar();
                        });
                      },
                    ),
                    IconButton(
                      icon: Text("/",
                          style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold)),
                      tooltip: 'Divisao',
                      onPressed: () {
                        setState(() {
                          _dividir();
                        });
                      },
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$_resultado',
                      style: TextStyle(fontSize: 30),
                    ),
                  ]),
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
            ]
        ),
      ),
    );
  }
}
