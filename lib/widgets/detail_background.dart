import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practica_5/constants.dart';
import 'package:practica_5/helper/get_colors.dart';

class DetailBackground extends StatelessWidget {
  final Widget child;
  final int id;
  // final String name;
  final String color;

  const DetailBackground({
    Key? key,
    required this.child,
    required this.id,
    // required this.name,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isWhite = false;
    if (color == 'white') {
      isWhite = true;
    }
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PurpleBox(color: color),
          _IconLogin(id: id,),
          _Title(isWhite: isWhite,),
          child,
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final bool isWhite;

  const _Title({Key? key, required this.isWhite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 30),
      child: Text(
        'Pokemon Detail',
        style: TextStyle(
          color: isWhite ? kTextSubTitle : kwhite,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    );
  }
}

class _IconLogin extends StatelessWidget {
  final int id;

  const _IconLogin({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(right: 80, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Hero(
              tag: 'poke-$id',
              child: SizedBox(
                width: size.width * .4,
                height: size.height * .4,
                // height: 300,
                child: SvgPicture.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/$id.svg')
              )
            ),
          ],
        ),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  final String color;

  const _PurpleBox({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.45,
      decoration: BoxDecoration(
        color: getColor(color),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        ),
      ),
      // decoration: _decorationPurpleBackground(),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 130, left: 30,),
          // Positioned(child: _Bubble(), top: -40, left: -30,),
          Positioned(child: _Bubble(), top: 20, right: 100,),
          Positioned(child: _Bubble(), bottom: -50, left: 100,),
          Positioned(child: _Bubble(), top: 200, right: 20,),
        ],
      ),
    );
  }

  BoxDecoration _decorationPurpleBackground() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]
    )
  );
}

class _Bubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: _bubbleDecoration(),
    );
  }

  BoxDecoration _bubbleDecoration() => BoxDecoration(
    borderRadius: BorderRadius.circular(100),
    color: const Color.fromRGBO(255, 255, 255, 0.1)
  );
}