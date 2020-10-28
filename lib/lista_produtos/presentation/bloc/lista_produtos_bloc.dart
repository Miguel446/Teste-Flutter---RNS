import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/lista_produtos_client_impl.dart';
import '../../domain/client/lista_produtos_client.dart';
import '../../domain/entity/produto_entity.dart';

part 'lista_produtos_event.dart';
part 'lista_produtos_state.dart';

class ListaProdutosBloc extends Bloc<ListaProdutosEvent, ListaProdutosState> {
  final ProdutosClient client = ProdutosClientImpl();

  @override
  ListaProdutosState get initialState => ListaProdutosInitial();

  @override
  Stream<ListaProdutosState> mapEventToState(
    ListaProdutosEvent event,
  ) async* {


    if (event is GetListaProdutos) {
      yield Loading();

      try {
        final _lista = await client.getListaProdutos();
        yield ListaCarregada(_lista);
      } catch (e) {
        yield Error(e.toString());
      }
    }
  }
}
