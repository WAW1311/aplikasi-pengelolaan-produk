import 'package:flutter/material.dart';
import 'home.dart';
import 'product.dart';

class Routing extends StatelessWidget {
  const Routing({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'route',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/product': (context) => const Product(),
      },
    );
  }
}
