part of 'lista_produtos_bloc.dart';

@immutable
abstract class ListaProdutosState {}

class ListaProdutosInitial extends ListaProdutosState {}

class Loading extends ListaProdutosState {}

class ListaCarregada extends ListaProdutosState {
  final List<Estoque> produtos;

  ListaCarregada(this.produtos);
}

class Error extends ListaProdutosState {
  final String message;

  Error(this.message);
}
