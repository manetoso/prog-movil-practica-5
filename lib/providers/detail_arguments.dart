import 'package:flutter/cupertino.dart';

class DetailArguments extends ChangeNotifier {
  String _color = '';
  String _name = '';
  int _id = 0;

  String get selectedColor {
    return _color;
  }
  set selectedColor(String c) {
    _color = c;
    notifyListeners();
  }
  String get selectedName {
    return _name;
  }
  set selectedName(String n) {
    _name = n;
    notifyListeners();
  }
  int get selectedId {
    return _id;
  }
  set selectedId(int i) {
    _id = i;
    notifyListeners();
  }
}