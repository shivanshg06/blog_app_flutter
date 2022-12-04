import 'package:flutter/material.dart';

AppBar mainAppBar({
  required String title,
  bool centre = true,
  required VoidCallback leadingF,
  bool main = false,
}) {
  return AppBar(
    title: Text(
      title,
    ),
    centerTitle: centre,
    leading: IconButton(
      onPressed: leadingF,
      icon: Icon(
        main ? Icons.menu : Icons.arrow_back,
        color: Colors.white,
      ),
    ),
  );
}

AppBar hiddenAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}
