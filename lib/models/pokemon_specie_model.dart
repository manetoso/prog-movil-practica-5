// To parse this JSON data, do
//
//     final pokemonSpecie = pokemonSpecieFromJson(jsonString);

// import 'dart:convert';

// PokemonSpecieModel pokemonSpecieFromJson(String str) => PokemonSpecieModel.fromJson(json.decode(str));

// String pokemonSpecieToJson(PokemonSpecieModel data) => json.encode(data.toJson());

class PokemonSpecieModel {
    PokemonSpecieModel({
        this.color,
    });

    Color? color;

    factory PokemonSpecieModel.fromMap(Map<String, dynamic> json) => PokemonSpecieModel(
        color: Color.fromMap(json["color"]),
    );

    // Map<String, dynamic> toJson() => {
    //     "color": color!.toJson(),
    // };
}

class Color {
    Color({
        this.name,
        this.url,
    });

    String? name;
    String? url;

    factory Color.fromMap(Map<String, dynamic> json) => Color(
        name: json["name"],
        url: json["url"],
    );

    // Map<String, dynamic> toJson() => {
    //     "name": name,
    //     "url": url,
    // };
}
