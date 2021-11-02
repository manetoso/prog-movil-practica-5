import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practica_5/models/models.dart';
class ApiEndpoints {
  Future<List<PokemonsModel>?> getPokemons() async{
    var URL = Uri.parse(
    'https://pokeapi.co/api/v2/pokemon?limit=1118'
    );
    final response = await http.get(URL);
    if (response.statusCode == 200) {
      var pokemons = jsonDecode(response.body)['results'] as List;
      List<PokemonsModel> listPokemons =
          pokemons.map((pokemon) => PokemonsModel.fromMap(pokemon)).toList();
      return listPokemons;
    } else {
      return null;
    }
  }
  Future<List<PokemonTypesModel>?> getPokemonTypes(int id) async {
    var URL = Uri.parse(
    'https://pokeapi.co/api/v2/pokemon/$id/'
    );
    final response = await http.get(URL);
    if (response.statusCode == 200) {
      var pokemon = jsonDecode(response.body)['types'] as List;
      List<PokemonTypesModel> pokemonData =
          pokemon.map((pokemonTypes) => PokemonTypesModel.fromMap(pokemonTypes)).toList();
      return pokemonData;
    } else {
      return null;
    }
  }
  Future<PokemonColorModel?> getPokemonColor(int id) async {
    var URL = Uri.parse(
    'https://pokeapi.co/api/v2/pokemon-species/$id/'
    );
    final response = await http.get(URL);
    if (response.statusCode == 200) {
      var pokemon = jsonDecode(response.body)['color'] as Map<String, dynamic>;
      PokemonColorModel pokemonColor = PokemonColorModel(
        name: pokemon['name'],
        url: pokemon['url']
      );
      return pokemonColor;
    } else {
      return null;
    }
  }
}