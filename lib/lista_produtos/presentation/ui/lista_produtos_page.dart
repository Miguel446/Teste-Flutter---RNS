import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/lista_produtos_bloc.dart';
import 'lista_produtos_widget.dart';

class ListaProdutosPage extends StatelessWidget {
  const ListaProdutosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListaProdutosBloc(),
      child: ListaProdutosWidget(),
    );
  }
}
