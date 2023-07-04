import 'package:brasileirao/controllers/theme_controler.dart';
import 'package:brasileirao/repository/times_repostiory.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import 'page/home_page.dart';

void main() {
  Get.lazyPut<ThemeController>(() => ThemeController());

  runApp(ChangeNotifierProvider(
    create: (context) => TimesRepository(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController.to.loadThemeMode();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BRASILEIRAO',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light),
      darkTheme: ThemeData.dark(),
      // themeMode: ThemeMode.system, // Defina o modo de tema para o sistema
      home: const HomePage(),
    );
  }
}
