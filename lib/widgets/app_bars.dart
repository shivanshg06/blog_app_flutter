import 'package:flutter/material.dart';

AppBar mainAppBar({
  required String title,
  bool centre = true,
}) {
  return AppBar(
    title: Text(
      title,
    ),
    centerTitle: centre,
  );
}

AppBar hiddenAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}
