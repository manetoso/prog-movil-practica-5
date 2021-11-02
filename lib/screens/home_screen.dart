import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practica_5/constants.dart';
import 'package:practica_5/helper/get_colors.dart';
import 'package:practica_5/models/models.dart';
import 'package:practica_5/network/api_endpoints.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      ApiEndpoints apiEndpoint = ApiEndpoints();
      
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kyellow,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(23.0), bottomRight: Radius.circular(23.0))
            ),
            child: Image.asset('assets/logo-pokemon-400x400.png'),
          )
        ),
        body: FutureBuilder(
          future: apiEndpoint.getPokemons(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<PokemonsModel>?> snapshot
          ) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Hay un error en la petición'),
              );
            } else {
              if (snapshot.connectionState == ConnectionState.done) {
                return _listPokemons(snapshot.data, context);
              } else {
                return const CircularProgressIndicator();
              }
            }
          }
        )
      );
    }

  Widget _listPokemons(List<PokemonsModel>? data, BuildContext context) {
    ApiEndpoints apiEndpoint = ApiEndpoints();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        itemCount: data!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.60,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (_, index) {
          PokemonsModel pokemons = data[index];
          return FutureBuilder(
            future: apiEndpoint.getPokemonColor(index + 1),
            builder: (
              BuildContext context,
              AsyncSnapshot<PokemonColorModel?> snapshot
            ) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Hay un error en la petición'),
                );
              } else {
                if (snapshot.connectionState == ConnectionState.done) {
                  return _pokemonColor(snapshot.data, pokemons, index+1, context);
                } else {
                  return const CircularProgressIndicator();
                }
              }
            }
          );
        },
      ),
    );
  }

  Widget _pokemonTypes(List<PokemonTypesModel>? data, PokemonColorModel? color, PokemonsModel? pokemon, int id, BuildContext context) {
    String nameCapitalized = pokemon!.name![0].toUpperCase() + pokemon.name!.substring(1);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(
          context, 'detail',
          arguments: {
            'id': id,
            'name': nameCapitalized,
            'color': color!.name,
          }
        );
      },
      child: Ink(
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(5,10),
              spreadRadius: 5,
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Container(
                height: 180,
                width: 160,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: getColor('${color!.name}'),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Hero(
                  tag: 'poke-$id',
                  child: SvgPicture.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/$id.svg')
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                nameCapitalized,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kTextSubTitle
                ),
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,
                  itemCount: data!.length,
                  itemBuilder: (_,index) {
                    PokemonTypesModel types = data[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/type-${types.type!.name}.png'),
                        ],
                      )
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pokemonColor(PokemonColorModel? color, PokemonsModel? pokemon, int id, BuildContext context) {
    // return Center(
    //   child: Text('${color!.name} ${pokemon!.name}'),
    // );
    ApiEndpoints apiEndpoint = ApiEndpoints();
    return FutureBuilder(
      future: apiEndpoint.getPokemonTypes(id),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<PokemonTypesModel>?> snapshot
      ) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Hay un error en la petición'),
          );
        } else {
          if (snapshot.connectionState == ConnectionState.done) {
            return _pokemonTypes(snapshot.data, color, pokemon, id, context);
          } else {
            return const CircularProgressIndicator();
          }
        }
      }
    );
  }
}