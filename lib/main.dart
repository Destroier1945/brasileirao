import 'package:brasileirao/repository/times_repostiory.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import 'page/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TimesRepository(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BRASILEIRAO',
      theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const HomePage(),
    );
  }
}
