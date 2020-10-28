import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_salcisne/lista_produtos/domain/entity/produto_entity.dart';

import '../bloc/lista_produtos_bloc.dart';

var produtos = new List<Estoque>();

class ListaProdutosWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de produtos')),
      body: Center(
        child: BlocBuilder<ListaProdutosBloc, ListaProdutosState>(
          bloc: BlocProvider.of<ListaProdutosBloc>(context),
          builder: (context, state) {
            if (state is ListaProdutosInitial) {
              BlocProvider.of<ListaProdutosBloc>(context)
                  .add(GetListaProdutos());
              return Center(child: CircularProgressIndicator());
            } else if (state is Error) {
              return Message(context, "Erro. Não foi possível carregar os produtos");
            } else if (state is Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ListaCarregada) {
              final stateAsListaCarregadaState = state as ListaCarregada;
              produtos = stateAsListaCarregadaState.produtos;
              if(produtos.length == 0){
                return  Message(context, "Nenhum produto foi encontrado");
              }
              return ListView.builder(
                padding: EdgeInsets.all(0.0),
                itemCount: produtos.length,
                itemBuilder: buildProdutos,
              );
            }else{
              return Message(context, "");
            }
          },
        ),
      ),
    );
  }
}

Widget buildProdutos(context, index){
  Estoque estoque = produtos[index];
  return Column(
    children: <Widget>[
      Card(
        elevation: 3,
        child: ListTile(
          trailing: Text(
            estoque.quantidade.toString(),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          title: Text(estoque.produto['nome'],
            style:
            TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
          ),
          subtitle: Text(
           estoque.filial['razaoSocial'],
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          leading: CircleAvatar(
            child: Icon(Icons.done, color: Colors.white,),
            backgroundColor: Colors.blue,
          ),
          onTap: () {},
        ),
      ),
    ],
  );
}

Widget Message(BuildContext context, String message) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Text(message),
    RaisedButton(
        child: Text("Tentar Novamente", style: TextStyle(color: Colors.white)),
        color: Colors.blue,
        onPressed: (){
          BlocProvider.of<ListaProdutosBloc>(context)
              .add(GetListaProdutos());
        })
  ],);
}
