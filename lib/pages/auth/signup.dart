// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, use_build_context_synchronously

import 'dart:developer';

import 'package:blog_app_flutter/backend/user_helper.dart';
import 'package:blog_app_flutter/pages/auth/signin.dart';
import 'package:blog_app_flutter/pages/auth/security_question.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:blog_app_flutter/widgets/styles/app_bars.dart';
import 'package:blog_app_flutter/widgets/buttons.dart';
import 'package:blog_app_flutter/widgets/styles/test_styles.dart';
import 'package:blog_app_flutter/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
            20, MediaQuery.of(context).size.height * 0.02, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/rocket.png'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                'Rocket Up Your Growth!',
                style: titleStyleVar(30),
              ),
              SizedBox(height: 20),
              textField1(
                nameController,
                'Name',
                TextInputType.name,
                false,
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
              textField1(
                confirmPasswordController,
                'Confirm Password',
                TextInputType.visiblePassword,
                true,
              ),
              SizedBox(height: 20),
              mainButton('Sign Up', context, signUp),
              SizedBox(height: 20),
              signInOption(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    if (password != confirmPassword) {
      log('Passwords Are Not Same');
      return;
    }
    var userToken = await _userHelper.register(name, email, password);
    _userToken = userToken;
    sharedPreferences.setString('userToken', userToken);
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: ((context) => SecurityQuestion(userToken: _userToken)),
      ),
    );
  }

  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style: TextStyle(
            fontSize: 15
          ),
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
                builder: (context) => const SignInPage(),
              ),
            );
          },
          child: Text(
            "Sign In",
            style: titleStyleVar(16),
          ),
        ),
      ],
    );
  }
}
