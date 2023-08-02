import 'package:flutter/material.dart';

class Medidas {
  static double _width = 0;
  static double _heigth = 0;

  Medidas(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _heigth = MediaQuery.of(context).size.height;
  }

  static double width(double porsentaje) {
    return _width * (porsentaje / 100);
  }

  static double heigth(double porsentaje) {
    return _heigth * (porsentaje / 100);
  }
}
