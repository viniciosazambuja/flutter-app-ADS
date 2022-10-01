
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/menu_component.dart';

class CalculadoraIOSPage extends StatefulWidget {
  const CalculadoraIOSPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CalculadoraIOSPage> createState() => _CalculadoraIOSPage();
}

class _CalculadoraIOSPage extends State<CalculadoraIOSPage> {
  late double _num, _num2 = 0;
  late String _resultado, _valorCalculo = '';



  final _inputControllerNum = TextEditingController();
  final _inputControllerNum2 = TextEditingController();

  List<String> _list =[];

  void _addValor(valor){
    _valorCalculo += valor;

    setState(() {
      _valorCalculo = _valorCalculo;
    });
  }

  void _setList() {
    _list.add(_resultado);
    _inputControllerNum.clear();
    _inputControllerNum2.clear();

    setState(() {
      _list = _list;
    });
  }

  void _limpaValor() {
    _valorCalculo = '';

    setState(() {
      _valorCalculo = _valorCalculo;
    });
  }

  void _calculoValor(){

    List<String> valores = [];
    List<String> caracteres = [];

    _valorCalculo.split('').forEach((valor) => {
      if(valor == 'x' || valor == '+' || valor == '/' || valor == '-'){
        caracteres.add(valor)
      } else {
        valores.add(valor)
      }
    });

    double total = 0;

    for(int i = 0; i <= valores.length; i++){

      if(i==0){
        double v1 = double.parse(valores[0]);
        double v2 = double.parse(valores[1]);
        switch (caracteres[0]){
          case '+': {
            total = v1 + v2;
            break;
          }
          case '-': {
            total = v1 - v2;
            break;
          }
          case 'x': {
            total = v1 * v2;
            break;
          }
          case '/': {
            total = v1 / v2;
            break;
          }
          default:{
            total: total;
            break;
          }
        }
      }
    }
    setState(() {
      _valorCalculo = '';
      _valorCalculo = total.toString();
    });
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
            onPressed: _limpaValor,
          )
        ],
      ),
      drawer: Menu(context),
      body: SingleChildScrollView(
        child: Column(

            children: <Widget>[
              Container(
                  child: Padding(
                    padding:  EdgeInsets.all(16.0),
                    child:  Text('${_valorCalculo}', style: TextStyle(color: Colors.black, fontSize: 50.0),),
              )) ,

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: (){
                        _limpaValor();
                      },
                      child: Text('Apagar', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text(' ', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text('%', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: () {
                        _addValor('/');
                        setState(() {

                        });
                      },
                      child: Text('/', style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        _addValor('7');
                      },
                      child: Text('7', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: () {
                        _addValor('8');
                        },
                      child: Text('8', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed:  () {
                        _addValor('9');
                      },
                      child: Text('9', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: () {
                        _addValor('x');
                        setState(() {

                        });
                      },
                      child: Text('x', style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed:  () {
                        _addValor('4');
                      },
                      child: Text('4', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed:  () {
                        _addValor('5');
                      },
                      child: Text('5', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed:  () {
                        _addValor('6');
                      },
                      child: Text('6', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: () {
                        _addValor('-');
                        setState(() {

                        });
                      },
                      child: Text('-', style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed:  () {
                        _addValor('1');
                      },
                      child: Text('1', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed:  () {
                        _addValor('2');
                      },
                      child: Text('2', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed:  () {
                        _addValor('3');
                      },
                      child: Text('3', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: () {
                        _addValor('+');
                        setState(() {

                        });
                      },
                      child: Text('+', style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed:  () {
                        _addValor('0');
                      },
                      child: Text('0', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed:  () {
                        _addValor('0');
                      },
                      child: Text('0', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text('.', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _calculoValor();
                        });
                      },
                      child: Text('=', style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold)),
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
