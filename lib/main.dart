import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

/*Regra:
  Se o preço do Álcool divido pelo preço da gasolina for >= 0.7 
  é melhor abastecer com gasolina, senão com Álcool*/