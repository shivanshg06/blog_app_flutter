// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:blog_app_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

mainButton(String text, BuildContext context, VoidCallback function) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 55,
    child: ElevatedButton(
      onPressed: function,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            return states.contains(MaterialState.pressed)
                ? accentColor
                : accentColor.withOpacity(0.5);
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    ),
  );
}
