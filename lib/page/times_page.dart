import 'package:brasileirao/page/add_titulo_page.dart';
import 'package:brasileirao/page/edit_titulo_page.dart';
import 'package:brasileirao/repository/times_repostiory.dart';
import 'package:brasileirao/widgets/widget_brasao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    Get.to(() => AddTituloPage(time: widget.time));
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
                child: Brasao(
                  image: widget.time.brasao,
                  width: 250,
                ),
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

  Widget titulos() {
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
              return ListTile(
                leading: const Icon(Icons.emoji_events),
                title: Text(time.titulos[index].campeonato),
                trailing: Text(time.titulos[index].ano),
                onTap: () {
                  Get.to(EditTituloPage(titulo: time.titulos[index]));
                  Dialog.fullscreen();
                },
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: quantidade);
  }
}
