import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setObservers([Asuka.asukaHeroController]);
    return MaterialApp.router(
      title: 'Popups',
      builder: (context, child) => Asuka.builder(context, child),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blueGrey,
        colorScheme: ColorScheme.fromSeed(
          background: Colors.white,
          seedColor: Colors.blueGrey,
        ).copyWith(
          primary: Colors.blueGrey,
        ),
      ),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
