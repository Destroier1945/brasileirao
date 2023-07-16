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
      required String campeonato}) async {
    var db = await DB.get();
    await db.update(
      'titulos',
      {'campeonato': campeonato, 'ano': ano},
      where: 'id = ?',
      whereArgs: [titulo.id],
    );
    titulo.campeonato = campeonato;
    titulo.ano = ano;
    notifyListeners();
  }

  void addTitulo({Time? time, Titulo? titulo}) async {
    var db = await DB.get();
    int id = await db.insert('titulos', {
      'campeonato': titulo!.campeonato,
      'ano': titulo.ano,
      'time_id': time!.id,
    });
    titulo.id = id;
    time.titulos.add(titulo);
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
        titulos: [],
      ),
      Time(
        id: 2,
        nome: 'Internacional',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/internacional/logo-internacional-256.png',
        cor: Colors.red,
        //idAPI: 44,
        titulos: [],
      ),
      Time(
        id: 3,
        nome: 'Atlético-MG',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/atletico-mineiro/logo-atletico-mineiro-256.png',
        cor: Colors.grey,
        //idAPI: 30,
        titulos: [],
      ),
      Time(
        id: 4,
        nome: 'São Paulo',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/sao-paulo/logo-sao-paulo-256.png',
        cor: Colors.red,
        //idAPI: 57,
        titulos: [],
      ),
      Time(
        id: 5,
        nome: 'Fluminense',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/fluminense/logo-fluminense-256.png',
        cor: Colors.teal,
        //idAPI: 26,
        titulos: [],
      ),
      Time(
        id: 6,
        nome: 'Grêmio',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/gremio/logo-gremio-256.png',
        cor: Colors.blue,
        // idAPI: 45,
        titulos: [],
      ),
      Time(
        id: 7,
        nome: 'Palmeiras',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/palmeiras/logo-palmeiras-256.png',
        cor: Colors.green,
        // idAPI: 56,
        titulos: [],
      ),
      Time(
        id: 8,
        nome: 'Santos',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/santos/logo-santos-256.png',
        cor: Colors.grey,
        //idAPI: 63,
        titulos: [],
      ),
      Time(
        id: 9,
        nome: 'Athletico-PR',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/atletico-paranaense/logo-atletico-paranaense-256.png',
        cor: Colors.red,
        // idAPI: 185,
        titulos: [],
      ),
      Time(
        id: 10,
        nome: 'Corinthians',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/corinthians/logo-corinthians-256.png',
        cor: Colors.grey,
        // idAPI: 65,
        titulos: [],
      ),
      Time(
        id: 11,
        nome: 'Bragantino',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/red-bull-bragantino/logo-red-bull-bragantino-256.png',
        cor: Colors.grey,
        // idAPI: 64,
        titulos: [],
      ),
      Time(
        id: 12,
        nome: 'Ceará',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/ceara/logo-ceara-256.png',
        cor: Colors.grey,
        // idAPI: 105,
        titulos: [],
      ),
      Time(
        id: 13,
        nome: 'Atlético-GO',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/atletico-goianiense/logo-atletico-goianiense-256.png',
        cor: Colors.red,
        // idAPI: 98,
        titulos: [],
      ),
      Time(
        id: 14,
        nome: 'Sport',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/sport-recife/logo-sport-recife-256.png',
        cor: Colors.red,
        // idAPI: 79,
        titulos: [],
      ),
      Time(
        id: 15,
        nome: 'Bahia',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/bahia/logo-bahia-256.png',
        cor: Colors.blue,
        //idAPI: 68,
        titulos: [],
      ),
      Time(
        id: 16,
        nome: 'Fortaleza',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/fortaleza/logo-fortaleza-256.png',
        cor: Colors.red,
        //idAPI: 131,
        titulos: [],
      ),
      Time(
        id: 17,
        nome: 'Vasco',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/vasco-da-gama/logo-vasco-da-gama-256.png',
        cor: Colors.grey,
        // idAPI: 23,
        titulos: [],
      ),
      Time(
        id: 18,
        nome: 'Goiás',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/goias/logo-goias-esporte-clube-256.png',
        cor: Colors.green,
        // idAPI: 115,
        titulos: [],
      ),
      Time(
        id: 19,
        nome: 'Coritiba',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/coritiba/logo-coritiba-5.png',
        cor: Colors.green,
        //  idAPI: 84,
        titulos: [],
      ),
      Time(
        id: 20,
        nome: 'Botafogo',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/botafogo/logo-botafogo-256.png',
        cor: Colors.grey,
        //idAPI: 22,
        titulos: [],
      ),
    ];
  }

  TimesRepository() {
    initRepository();
  }

  initRepository() async {
    var db = await DB.get();
    List times = await db.query('times');

    for (var time in times) {
      String colorValue = time['cor'].toString().split('0x')[1];
      int colorIntValue = int.parse(colorValue, radix: 16);
      Color color = Color(colorIntValue);
      _times.add(Time(
        id: time['id'],
        nome: time['nome'],
        brasao: time['brasao'],
        pontos: time['pontos'],
        cor: color,
        titulos: await getTitulos(time['id']),
      ));
    }

    notifyListeners();
  }
}

Future<List<Titulo>> getTitulos(timeId) async {
  var db = await DB.get();
  var results =
      await db.query('titulos', where: 'time_id = ? ', whereArgs: [timeId]);
  List<Titulo> titulos = [];
  if (results != null) {
    for (var titulo in results) {
      titulos.add(Titulo(
        ano: titulo['ano'].toString(),
        campeonato: titulo['campeonato'],
        id: titulo['id'],
      ));
    }
  }
  return titulos;
}
