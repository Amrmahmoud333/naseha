import 'package:flutter/material.dart';

class Sizer {
  BuildContext context;
  Sizer({required this.context});
  double h(double height) {
    return MediaQuery.of(context).size.height * (height / 851);
  }

  double w(double width) {
    return MediaQuery.of(context).size.width * (width / 393);
  }
}
