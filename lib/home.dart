// ignore_for_file: prefer_const_constructors,

import 'dart:ui';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();

  String _resultado = '';

  void _calcular() {
    var precoAlcool = double.tryParse(_controllerAlcool.text);
    var precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _resultado =
            '*número inválido, digite números maiores que 0 e utlizando (.)';
      });
    } else {
      setState(
        () {
          if (precoAlcool / precoGasolina >= 0.7) {
            _resultado = 'Abasteça com Gasolina';
          } else {
            _resultado = 'Abasteça com Álcool';
          }
        },
      );
    }
  }

  void _limpar() {
    _controllerAlcool.text = '';
    _controllerGasolina.text = '';
    setState(() {
      _resultado = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Álcool ou Gasolina?'),
      ),
      body: Container(
          padding: EdgeInsets.all(32),
          child: ListView(
            children: [
              Image.asset('assets/images/logo.png'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 35, bottom: 15),
                    child: Text(
                      'Saiba qual a melhor opção para o abastecimento do seu carro',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                  ),
                  //adicionado ícone de restar caso o usuário queira limpar as informações
                  //o método _limpar não foi chamado no botão pois dessa maneira ao calcular ainda é informado quais os valores utilizados
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: GestureDetector(
                      child: Image.asset(
                        'assets/images/restart_icon.png',
                        width: 25,
                      ),
                      onTap: () {
                        _limpar();
                      },
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Preço Álcool (ex: 1.59)',
                ),
                style: TextStyle(fontSize: 22),
                //maxLength: 4,
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Preço Gasolina (ex: 2.59)',
                ),
                style: TextStyle(fontSize: 22),
                //maxLength: 4,
                controller: _controllerGasolina,
              ),
              Padding(padding: EdgeInsets.only(top: 12)),
              Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: _calcular,
                      child: Text('Calcular',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 38),
                child: Text(
                  _resultado,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
                ),
              ),
            ],
          )),
    );
  }
}
