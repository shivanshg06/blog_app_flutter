// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:blog_app_flutter/pages/signin.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:blog_app_flutter/widgets/app_bars.dart';
import 'package:blog_app_flutter/widgets/buttons.dart';
import 'package:blog_app_flutter/widgets/text_fields.dart';
import 'package:flutter/material.dart';

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
                'Sign Up\nRocket Up Your Growth!',
                style: TextStyle(
                  fontSize: 30,
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              textField1(
                emailController,
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
                passwordController,
                'Confirm Password',
                TextInputType.visiblePassword,
                true,
              ),
              SizedBox(height: 20),
              mainButton('Sign Up', context),
              SizedBox(height: 20),
              signInOption(),
            ],
          ),
        ),
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
            fontSize: 15,
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
          child: const Text(
            "Sign In",
            style: TextStyle(
              color: accentColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}