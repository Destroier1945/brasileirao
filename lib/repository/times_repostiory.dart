import 'dart:collection';

import 'package:brasileirao/database/db.dart';
import 'package:brasileirao/model/time.dart';
import 'package:flutter/material.dart';
import '../model/titulo.dart';

class TimesRepository extends ChangeNotifier {
  final List<Time> _times = [];

  UnmodifiableListView<Time> get times => UnmodifiableListView(_times);

  void editTitulo(
      {required Titulo titulo,
      required String ano,
      required String campeonato}) {
    titulo.campeonato = campeonato;
    titulo.ano = ano;
    notifyListeners();
  }

  void addTitulo({Time? time, Titulo? titulo}) {
    time!.titulos.add(titulo!);
    notifyListeners();
  }

  static setupTimes() {
    return [
      Time(
        id: 1,
        nome: 'Flamengo',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/flamengo/logo-flamengo-256.png',
        cor: Colors.red,
        //idAPI: 18,
      ),
      Time(
        id: 2,
        nome: 'Internacional',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/internacional/logo-internacional-256.png',
        cor: Colors.red,
        //idAPI: 44,
      ),
      Time(
        id: 3,
        nome: 'Atlético-MG',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/atletico-mineiro/logo-atletico-mineiro-256.png',
        cor: Colors.grey,
        //idAPI: 30,
      ),
      Time(
        id: 4,
        nome: 'São Paulo',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/sao-paulo/logo-sao-paulo-256.png',
        cor: Colors.red,
        //idAPI: 57,
      ),
      Time(
        id: 5,
        nome: 'Fluminense',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/fluminense/logo-fluminense-256.png',
        cor: Colors.teal,
        //idAPI: 26,
      ),
      Time(
        id: 6,
        nome: 'Grêmio',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/gremio/logo-gremio-256.png',
        cor: Colors.blue,
        // idAPI: 45,
      ),
      Time(
        id: 7,
        nome: 'Palmeiras',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/palmeiras/logo-palmeiras-256.png',
        cor: Colors.green,
        // idAPI: 56,
      ),
      Time(
        id: 8,
        nome: 'Santos',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/santos/logo-santos-256.png',
        cor: Colors.grey,
        //idAPI: 63,
      ),
      Time(
        id: 9,
        nome: 'Athletico-PR',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/atletico-paranaense/logo-atletico-paranaense-256.png',
        cor: Colors.red,
        // idAPI: 185,
      ),
      Time(
        id: 10,
        nome: 'Corinthians',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/corinthians/logo-corinthians-256.png',
        cor: Colors.grey,
        // idAPI: 65,
      ),
      Time(
        id: 11,
        nome: 'Bragantino',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/red-bull-bragantino/logo-red-bull-bragantino-256.png',
        cor: Colors.grey,
        // idAPI: 64,
      ),
      Time(
        id: 12,
        nome: 'Ceará',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/ceara/logo-ceara-256.png',
        cor: Colors.grey,
        // idAPI: 105,
      ),
      Time(
        id: 13,
        nome: 'Atlético-GO',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/atletico-goianiense/logo-atletico-goianiense-256.png',
        cor: Colors.red,
        // idAPI: 98,
      ),
      Time(
        id: 14,
        nome: 'Sport',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/sport-recife/logo-sport-recife-256.png',
        cor: Colors.red,
        // idAPI: 79,
      ),
      Time(
        id: 15,
        nome: 'Bahia',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/bahia/logo-bahia-256.png',
        cor: Colors.blue,
        //idAPI: 68,
      ),
      Time(
        id: 16,
        nome: 'Fortaleza',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/fortaleza/logo-fortaleza-256.png',
        cor: Colors.red,
        //idAPI: 131,
      ),
      Time(
        id: 17,
        nome: 'Vasco',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/vasco-da-gama/logo-vasco-da-gama-256.png',
        cor: Colors.grey,
        // idAPI: 23,
      ),
      Time(
        id: 18,
        nome: 'Goiás',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/goias/logo-goias-esporte-clube-256.png',
        cor: Colors.green,
        // idAPI: 115,
      ),
      Time(
        id: 19,
        nome: 'Coritiba',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/coritiba/logo-coritiba-5.png',
        cor: Colors.green,
        //  idAPI: 84,
      ),
      Time(
        id: 20,
        nome: 'Botafogo',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/botafogo/logo-botafogo-256.png',
        cor: Colors.grey,
        //idAPI: 22,
      ),
    ];
  }

  TimesRepository() {
    initRepository();
  }
}

initRepository() async {
  var db = DB.get();
  List times = await db.query('times');

  for (var time in times) {
    times.add(Time(
        id: time['id'],
        nome: time['nome'],
        brasao: time['brasao'],
        pontos: time['pontos'],
        cor: Color(int.parse(time['cor']))));
  }
}
