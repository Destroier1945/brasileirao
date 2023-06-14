import 'package:brasileirao/model/titulo.dart';
import 'package:brasileirao/page/add_titulo_page.dart';
import 'package:brasileirao/repository/times_repostiory.dart';
import 'package:flutter/material.dart';
import '../model/time.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TimePage extends StatefulWidget {
  Time time;
  TimePage({super.key, required this.time});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  tituloPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddTituloPage(time: widget.time),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.time.cor,
          title: Text(widget.time.nome),
          actions: [
            IconButton(onPressed: tituloPage, icon: const Icon(Icons.add))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.stacked_line_chart),
                text: 'Estatisticas',
              ),
              Tab(
                icon: Icon(Icons.emoji_events),
                text: 'Titulos',
              )
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Image.network(
                    widget.time.brasao.replaceAll('40x40', '100x100')),
              ),
              Text(
                'Pontos: ${widget.time.pontos}',
                style: const TextStyle(fontSize: 24),
              )
            ],
          ),
          titulos(),
        ]),
      ),
    );
  }

  titulos() {
    final time = Provider.of<TimesRepository>(context)
        .times
        .firstWhere((t) => t.nome == widget.time.nome);
    final quantidade = time.titulos.length;
    return quantidade == 0
        ? const Center(
            child: Text('Nenhum titulo  ainda'),
          )
        : ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              ListTile(
                leading: const Icon(Icons.emoji_events),
                title: Text(time.titulos[index].campeonato),
                trailing: Text(time.titulos[index].ano),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: quantidade);
  }
}
