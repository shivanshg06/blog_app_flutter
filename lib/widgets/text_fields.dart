// ignore_for_file: prefer_const_constructors

import 'package:blog_app_flutter/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextField textField1(TextEditingController textEditingController,
    String display, TextInputType keyboard, bool password) {
  return TextField(
    keyboardType: keyboard,
    controller: textEditingController,
    obscureText: password,
    maxLengthEnforcement: MaxLengthEnforcement.enforced,
    cursorColor: accentColor,
    decoration: InputDecoration(
      label: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Text(
          display,
          style: TextStyle(
            color: accentColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          width: 1,
          style: BorderStyle.solid,
          color: accentColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          width: 2,
          style: BorderStyle.solid,
          color: accentColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          width: 2,
          style: BorderStyle.solid,
          color: accentColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          width: 2,
          style: BorderStyle.solid,
          color: accentColor,
        ),
      ),
    ),
  );
}

TextField textField1_5(TextEditingController textEditingController,
    String display, TextInputType keyboard, bool password) {
  return TextField(
    keyboardType: keyboard,
    controller: textEditingController,
    obscureText: password,
    maxLengthEnforcement: MaxLengthEnforcement.enforced,
    cursorColor: accentColor,
    maxLines: 1,
    maxLength: 50,
    decoration: InputDecoration(
      label: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Text(
          display,
          style: TextStyle(
            color: accentColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          width: 1,
          style: BorderStyle.solid,
          color: accentColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          width: 2,
          style: BorderStyle.solid,
          color: accentColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          width: 2,
          style: BorderStyle.solid,
          color: accentColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          width: 2,
          style: BorderStyle.solid,
          color: accentColor,
        ),
      ),
    ),
  );
}

TextField textField2(TextEditingController textEditingController,
    String display, TextInputType keyboard) {
  return TextField(
    keyboardType: keyboard,
    controller: textEditingController,
    maxLengthEnforcement: MaxLengthEnforcement.enforced,
    cursorColor: accentColor,
    maxLength: 3000,
    maxLines: null,
    decoration: InputDecoration(
      label: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Text(
          display,
          style: TextStyle(
            color: accentColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          width: 1,
          style: BorderStyle.solid,
          color: accentColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          width: 2,
          style: BorderStyle.solid,
          color: accentColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          width: 2,
          style: BorderStyle.solid,
          color: accentColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          width: 2,
          style: BorderStyle.solid,
          color: accentColor,
        ),
      ),
    ),
  );
}
