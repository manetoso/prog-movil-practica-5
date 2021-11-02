import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:practica_5/constants.dart';
import 'package:practica_5/helper/get_colors.dart';
import 'package:practica_5/widgets/widgets.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final size = MediaQuery.of(context).size;
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: getColor(args['color']),
        ),
        body: DetailBackground(
          id: args['id'],
          // name: args['name'],
          color: args['color'],
          child: Column(
            children: [
              SizedBox(height: size.height * 0.35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo-pokemon-400x400.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${args['name']}',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kTextSubTitle
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: SizedBox(
                  height: size.height * .3,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          height: size.height * .3,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFEFEF),
                            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                            border: Border.all(
                              color: kTextPrimary,
                              width: 2.5
                            ),
                          ),
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Tap on the card to flip it!',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kTextPrimary
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FlipCard(
                                    fill: Fill.fillBack,
                                    direction: FlipDirection.HORIZONTAL,
                                    flipOnTouch: true,
                                    front: Container(
                                      color: getColor(args["color"]),
                                      height: 150,
                                      child: Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${args["id"]}.png'),
                                    ),
                                    back: Container(
                                      color: getColor(args["color"]),
                                      height: 150,
                                      child: Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/${args["id"]}.png'),
                                    ),
                                  ),
                                  FlipCard(
                                    fill: Fill.fillBack,
                                    direction: FlipDirection.HORIZONTAL,
                                    flipOnTouch: true,
                                    front: Container(
                                      color: getColor(args["color"]),
                                      height: 150,
                                      child: Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/${args["id"]}.png'),
                                    ),
                                    back: Container(
                                      color: getColor(args["color"]),
                                      height: 150,
                                      child: Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/${args["id"]}.png'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          height: size.height * .3,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFEFEF),
                            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                            border: Border.all(
                              color: kTextPrimary,
                              width: 2.5
                            ),
                          ),
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Tap on the card to flip it!',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kTextPrimary
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlipCard(
                                    fill: Fill.fillBack,
                                    direction: FlipDirection.HORIZONTAL,
                                    flipOnTouch: true,
                                    front: Container(
                                      color: getColor(args["color"]),
                                      height: 150,
                                      child: Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${args["id"]}.png'),
                                    ),
                                    back: Container(
                                      color: getColor(args["color"]),
                                      height: 150,
                                      child: Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/${args["id"]}.png'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),    
                  ),
                ),
              ),
            ],
          ),
        )
      );
    }
}