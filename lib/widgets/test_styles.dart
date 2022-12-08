import 'package:blog_app_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

TextStyle titleStyle() {
  return const TextStyle(
    fontSize: 35,
    color: accentColor,
    fontWeight: FontWeight.bold,
  );
}

TextStyle titleStyleVar(double size) {
  return TextStyle(
    fontSize: size,
    color: accentColor,
    fontWeight: FontWeight.bold,
  );
}
