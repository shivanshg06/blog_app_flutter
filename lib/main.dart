// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:blog_app_flutter/pages/home.dart';
import 'package:blog_app_flutter/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var userToken = prefs.getString("userToken");
  log('$userToken');

  runApp(
    userToken == null ? MyApp() : MyAppLogged(userToken: userToken),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: OnboardingScreen(),
    );
  }
}

class MyAppLogged extends StatelessWidget {
  const MyAppLogged({super.key, required this.userToken});
  final String userToken;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(userToken: userToken),
    );
  }
}
