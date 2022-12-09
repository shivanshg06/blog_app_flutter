// ignore_for_file:unused_field, use_build_context_synchronously

import 'dart:developer';

import 'package:blog_app_flutter/backend/user_helper.dart';
import 'package:blog_app_flutter/pages/home.dart';
import 'package:blog_app_flutter/pages/auth/signup.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:blog_app_flutter/widgets/styles/app_bars.dart';
import 'package:blog_app_flutter/widgets/buttons.dart';
import 'package:blog_app_flutter/widgets/styles/test_styles.dart';
import 'package:blog_app_flutter/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/person.png'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Text(
                'Identify Yourself',
                style: titleStyleVar(30),
              ),
              const SizedBox(height: 20),
              textField1(
                emailController,
                'Email',
                TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              PasswordTextField(
                textEditingController: passwordController,
                display: 'Password',
                keyboard: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 20),
              mainButton('Sign In', context, signIn),
              const SizedBox(height: 20),
              signUpOption(),
              const SizedBox(height: 20),
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

    try {
      var userToken = await _userHelper.signin(email, password);
      log('Status Code ${userToken[1]}');
      if (userToken[1] == 200) {
        log('Success');
        log(userToken[0]);
        _userToken = userToken[0];
        sharedPreferences.setString('userToken', userToken[0]);
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => HomePage(
                  userToken: _userToken,
                )),
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
