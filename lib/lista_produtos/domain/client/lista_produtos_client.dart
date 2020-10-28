import 'package:teste_salcisne/lista_produtos/domain/entity/produto_entity.dart';

abstract class ProdutosClient {
  Future<List<Estoque>> getListaProdutos();
}
