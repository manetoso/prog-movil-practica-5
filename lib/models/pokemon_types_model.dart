// To parse this JSON data, do
//
//     final pokemonTypesModel = pokemonTypesModelFromMap(jsonString);

// import 'dart:convert';

// PokemonTypesModel pokemonTypesModelFromMap(String str) => PokemonTypesModel.fromMap(json.decode(str));

// String pokemonTypesModelToMap(PokemonTypesModel data) => json.encode(data.toMap());

class PokemonTypesModel {
    PokemonTypesModel({
        this.slot,
        this.type,
    });

    int? slot;
    Type? type;

    factory PokemonTypesModel.fromMap(Map<String, dynamic> json) => PokemonTypesModel(
        slot: json["slot"],
        type: Type.fromMap(json["type"]),
    );

    Map<String, dynamic> toMap() => {
        "slot": slot,
        "type": type?.toMap(),
    };
}

class Type {
    Type({
        this.name,
        this.url,
    });

    String? name;
    String? url;

    factory Type.fromMap(Map<String, dynamic> json) => Type(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}
