import 'package:com_mokollmar/config/colors.dart';
import 'package:com_mokollmar/home/homepage.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mokollmar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: mcgpalette0),
      home: const HomePage(),
    );
  }
}
