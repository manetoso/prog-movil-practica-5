// Generated by https://quicktype.io

class PokemonsModel {
  String? name;
  String? url;

  PokemonsModel({
    this.name,
    this.url,
  });

  factory PokemonsModel.fromMap(Map<String, dynamic> map) {
    return PokemonsModel(
      name: map['name'],
      url: map['url'],
    );
  }
}