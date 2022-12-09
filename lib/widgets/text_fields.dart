// ignore_for_file: prefer_const_constructors

import 'package:blog_app_flutter/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextField textField1(TextEditingController textEditingController,
    String display, TextInputType keyboard) {
  return TextField(
    keyboardType: keyboard,
    maxLengthEnforcement: MaxLengthEnforcement.enforced,
    cursorColor: accentColor,
    controller: textEditingController,
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

TextField textField3(TextEditingController textEditingController,
    String display, TextInputType keyboard, int limit) {
  return TextField(
    keyboardType: keyboard,
    controller: textEditingController,
    maxLengthEnforcement: MaxLengthEnforcement.enforced,
    cursorColor: accentColor,
    maxLength: limit,
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

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.textEditingController,
    required this.display,
    required this.keyboard,
  });

  final TextEditingController textEditingController;
  final String display;
  final TextInputType keyboard;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool visiblePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.keyboard,
      controller: widget.textEditingController,
      obscureText: visiblePassword,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      cursorColor: accentColor,
      decoration: InputDecoration(
        label: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            widget.display,
            style: TextStyle(
              color: accentColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        suffixIconColor: Colors.white,
        suffixIcon: IconButton(
          onPressed: (() {
            setState(() {
              visiblePassword = !visiblePassword;
            });
          }),
          icon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
            child: Icon(
              visiblePassword ? Icons.visibility : Icons.visibility_off,
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
}
