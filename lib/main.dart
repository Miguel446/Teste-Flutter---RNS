import 'package:flutter/material.dart';
import 'package:teste_salcisne/lista_produtos/presentation/ui/lista_produtos_page.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListaProdutosPage(),
    );
  }
}
