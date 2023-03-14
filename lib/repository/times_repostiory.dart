import 'package:brasileirao/model/time.dart';
import 'package:flutter/material.dart';
import '../model/titulo.dart';

class TimesRepository{
  final List<Time> _times = [];

  get times => _times;



  TimesRepository(){
    Time(nome: 'Atlhetico', brasao: 'https://e.imguol.com/futebol/brasoes/40x40/athletico.png', pontos: 0,cor: Colors.red);
    Time(nome: 'America-MG', brasao: 'https://e.imguol.com/futebol/brasoes/40x40/america-mg.png', pontos: 0, cor: Colors.green);
    Time(nome: 'Atletico-MG', brasao: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-mg.png', pontos: 0, cor: Colors.black);
    Time(nome: 'Bahia', brasao: 'https://e.imguol.com/futebol/brasoes/40x40/bahia.png', pontos: 0, cor: Colors.blue);
    Time(nome: 'Botafogo', brasao: 'https://e.imguol.com/futebol/brasoes/40x40/botafogo.png', pontos: 0, cor: Colors.black);
    Time(nome: 'Corinthinas', brasao: 'https://e.imguol.com/futebol/brasoes/40x40/corinthians.png', pontos: 0, cor: Colors.black45);
  }
}