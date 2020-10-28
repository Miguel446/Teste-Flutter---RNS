import 'dart:convert';
import 'dart:io';

import 'package:teste_salcisne/lista_produtos/domain/entity/produto_entity.dart';
import 'package:http/http.dart' as http;

import '../domain/client/lista_produtos_client.dart';

class ProdutosClientImpl implements ProdutosClient {
  static String localhost = "10.0.0.128"; //TODO configure seu ip local aqui
  final String url = "http://" + localhost + ":8080/estoque/find-all";
  var client = http.Client();

  List<Estoque> produtos = [
    Estoque(produto: "Produto 1", filial: "Local A", quantidade: 20),
    Estoque(produto: "Produto 2", filial: "Local B", quantidade: 18),
    Estoque(produto: "Produto 3", filial: "Local C", quantidade: 16),
  ];

  @override
  Future<List<Estoque>> getListaProdutos() async {
    //return produtos;
    try {
      var _response = await client.get(url);
      if (_response.statusCode == HttpStatus.ok) {
        final _json = json.decode(_response.body);

        return _json
            .map<Estoque>((_produtoJson) => Estoque.fromJson(_produtoJson))
            .toList(growable: true);
      } else {
        throw http.ClientException("Houve um erro na requisição");
      }
    } catch (e) {
      throw http.ClientException("Erro inesperado");
    }
  }
}
