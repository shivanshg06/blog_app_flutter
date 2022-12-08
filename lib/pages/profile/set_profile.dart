// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:blog_app_flutter/pages/home.dart';
import 'package:blog_app_flutter/widgets/app_bars.dart';
import 'package:blog_app_flutter/widgets/buttons.dart';
import 'package:flutter/material.dart';

class Setprofile extends StatefulWidget {
  const Setprofile({super.key, required this.userToken});
  final String userToken;
  @override
  State<Setprofile> createState() => _SetprofileState();
}

class _SetprofileState extends State<Setprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hiddenAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              mainButton('Set Later', context, setLater),
              
            ],
          ),
        ),
      ),
    );
  }

  void setLater() {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: ((context) => HomePage(userToken: widget.userToken)),
      ),
    );
  }
}
