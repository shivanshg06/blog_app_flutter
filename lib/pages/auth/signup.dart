// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously

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
import 'package:fluttertoast/fluttertoast.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/rocket.png'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                'Rocket Up Your Growth!',
                style: titleStyleVar(30),
              ),
              const SizedBox(height: 20),
              textField1(nameController, 'Name', TextInputType.name),
              const SizedBox(height: 20),
              textField1(emailController, 'Email', TextInputType.emailAddress),
              const SizedBox(height: 20),
              PasswordTextField(
                textEditingController: passwordController,
                display: 'Password',
                keyboard: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 20),
              PasswordTextField(
                textEditingController: confirmPasswordController,
                display: 'Confirm Password',
                keyboard: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 20),
              mainButton('Sign Up', context, signUp),
              const SizedBox(height: 20),
              signInOption(),
            ],
          ),
        ),
      ),
    );
  }

  void signUp() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    if (password != confirmPassword) {
      Fluttertoast.showToast(
        msg: 'Passwords are not Equal!',
        toastLength: Toast.LENGTH_LONG,
        textColor: accentColor,
        backgroundColor: Colors.white,
        fontSize: 16,
        gravity: ToastGravity.BOTTOM,
      );
      return;
    }
    try {
      log('OK');
      var userToken = await _userHelper.register(name, email, password);
      log('Status Code ${userToken[1]}');
      if (userToken[1] == 201) {
        log('Success');
        log(userToken[0]);
        _userToken = userToken[0];
        sharedPreferences.setString('userToken', userToken[0]);
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => SecurityQuestion(userToken: _userToken)),
          ),
        );
      } else {
        log('Fail $userToken');
        Fluttertoast.showToast(
          msg: userToken[0],
          toastLength: Toast.LENGTH_LONG,
          textColor: accentColor,
          backgroundColor: Colors.white,
          fontSize: 16,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (e) {
      log('Error Caught ::$e');
    }
  }

  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
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
