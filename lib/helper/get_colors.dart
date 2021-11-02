import 'package:flutter/material.dart';
import 'package:practica_5/constants.dart';

getColor(String color){
  switch (color) {
    case 'black':
    return kblack;
    case 'blue':
    return kblue;
    case 'brown':
    return kbrown;
    case 'gray':
    return kgray;
    case 'green':
    return kgreen;
    case 'pink':
    return kpink;
    case 'purple':
    return kpurple;
    case 'red':
    return kred;
    case 'white':
    return kwhite;
    case 'yellow':
    return kyellow;
  }
}