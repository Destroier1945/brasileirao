import 'package:flutter/material.dart';

import '../model/titulo.dart';

class Time {
  int id;
  String nome;
  String brasao;
  int pontos;
  Color cor;
  List<Titulo> titulos = [];

  Time(
      {required this.id,
      required this.nome,
      required this.brasao,
      required this.pontos,
      required this.cor,
      required this.titulos});
}
