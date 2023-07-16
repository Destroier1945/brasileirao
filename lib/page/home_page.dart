import 'package:brasileirao/controllers/theme_controler.dart';
import 'package:brasileirao/model/time.dart';
import 'package:brasileirao/page/times_page.dart';
import 'package:brasileirao/repository/times_repostiory.dart';
import 'package:brasileirao/services/auth_service.dart';
import 'package:brasileirao/widgets/widget_brasao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = ThemeController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BRASILEIRAO'),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: ListTile(
                        leading: Obx(
                          () => controller.isDark.value
                              ? const Icon(Icons.brightness_7)
                              : const Icon(Icons.brightness_2),
                        ),
                        title: Obx(() => controller.isDark.value
                            ? const Text('light')
                            : const Text('dark')),
                        onTap: () => controller.changeTheme(),
                      ),
                    ),
                    PopupMenuItem(
                        child: ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text('Sair'),
                      onTap: () {
                        Navigator.pop(context);
                        AuthService.to.logout();
                      },
                    ))
                  ])
        ],
      ),
      body: Consumer<TimesRepository>(
        builder: (context, repositorio, child) {
          return ListView.separated(
            itemCount: repositorio.times.length,
            itemBuilder: (BuildContext contexto, int time) {
              final List<Time> tabela = repositorio.times;
              return ListTile(
                leading: Brasao(
                  image: tabela[time].brasao,
                  width: 40,
                ),
                title: Text(tabela[time].nome),
                subtitle: Text('Titulos: ${tabela[time].titulos.length}'),
                trailing: Text(
                  tabela[time].pontos.toString(),
                ),
                onTap: () {
                  Get.to(() => TimePage(
                        key: Key(tabela[time].nome),
                        time: tabela[time],
                      ));
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
