import 'package:blog_app_flutter/pages/home.dart';
import 'package:blog_app_flutter/widgets/styles/app_bars.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
