import 'package:brasileirao/model/time.dart';
import 'package:brasileirao/page/home_controller.dart';
import 'package:brasileirao/page/times_page.dart';
import 'package:brasileirao/repository/times_repostiory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BRASILEIRAO'),
      ),
      body: Consumer<TimesRepository>(
        builder: (context, repositorio, child) {
          return ListView.separated(
            itemCount: repositorio.times.length,
            itemBuilder: (BuildContext contexto, int i) {
              final List<Time> tabela = repositorio.times;
              return ListTile(
                leading: Image.network(tabela[i].brasao),
                title: Text(tabela[i].nome),
                subtitle: Text('Titulos: ${tabela[i].titulos.length}'),
                trailing: Text(
                  tabela[i].pontos.toString(),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => TimePage(
                                key: Key(tabela[i].nome),
                                time: tabela[i],
                              )));
                },
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            padding: const EdgeInsets.all(16),
          );
        },
      ),
    );
  }
}
