// ignore_for_file: prefer_const_constructors, unused_field, use_build_context_synchronously

import 'dart:developer';

import 'package:blog_app_flutter/backend/user_helper.dart';
import 'package:blog_app_flutter/pages/home.dart';
import 'package:blog_app_flutter/pages/auth/signup.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:blog_app_flutter/widgets/app_bars.dart';
import 'package:blog_app_flutter/widgets/buttons.dart';
import 'package:blog_app_flutter/widgets/test_styles.dart';
import 'package:blog_app_flutter/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final UserHelper _userHelper = UserHelper();
  String _userToken = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hiddenAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(
            20, MediaQuery.of(context).size.height * 0.05, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/person.png'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Text(
                'Identify Yourself',
                style: titleStyleVar(30),
              ),
              SizedBox(height: 20),
              textField1(
                emailController,
                'Email',
                TextInputType.emailAddress,
                false,
              ),
              SizedBox(height: 20),
              textField1(
                passwordController,
                'Password',
                TextInputType.visiblePassword,
                true,
              ),
              SizedBox(height: 20),
              mainButton('Sign In', context, signIn),
              SizedBox(height: 20),
              signUpOption(),
              SizedBox(height: 20),
              forgotPasswordOption(),
            ],
          ),
        ),
      ),
    );
  }

  void signIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String email = emailController.text;
    String password = passwordController.text;

    var userToken = await _userHelper.signin(email, password);
    log(_userToken);
    _userToken = userToken;
    sharedPreferences.setString('userToken', userToken);
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: ((context) => HomePage(
              userToken: _userToken,
            )),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(
          width: 2,
        ),
        GestureDetector(
          onTap: () {
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpPage(),
              ),
            );
          },
          child: Text(
            "Sign Up",
            style: titleStyleVar(16),
          ),
        ),
      ],
    );
  }

  Row forgotPasswordOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Forgot Password?",
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(
          width: 2,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Click Here",
            style: titleStyleVar(16),
          ),
        ),
      ],
    );
  }
}
