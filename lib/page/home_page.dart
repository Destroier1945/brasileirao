import 'package:brasileirao/model/time.dart';
import 'package:brasileirao/page/home_controller.dart';
import 'package:brasileirao/page/times_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller = HomeController();
    _loadTimes();
  }

  Future<void> _loadTimes() async {
    await controller.loadTimes();
    setState(() {}); // Atualiza a tela para exibir os times carregados
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BRASILEIRAO'),
      ),
      body: ListView.separated(
        itemCount: controller.tabela.length,
        itemBuilder: (BuildContext contexto, int i) {
          final List<Time> tabela = controller.tabela;
          return ListTile(
            leading: Image.network(tabela[i].brasao),
            title: Text(tabela[i].nome),
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
        separatorBuilder: (_, __) => Divider(),
        padding: EdgeInsets.all(16),
      ),
    );
  }
}
