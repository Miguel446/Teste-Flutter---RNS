class Estoque {
  dynamic produto;
  dynamic filial;
  int quantidade;

  Estoque({
    this.produto,
    this.filial,
    this.quantidade,
  });

  factory Estoque.fromJson(Map<String, dynamic> json) => Estoque(
        produto: json["produto"],
        filial: json["filial"],
        quantidade: json["quantidade"],
      );

  Map<String, dynamic> toJson() => {
        "produto": produto,
        "local": filial,
        "quantidade": quantidade,
      };
}
