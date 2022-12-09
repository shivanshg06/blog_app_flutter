// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:developer';

import 'package:blog_app_flutter/backend/user_helper.dart';
import 'package:blog_app_flutter/pages/home.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:blog_app_flutter/widgets/buttons.dart';
import 'package:blog_app_flutter/widgets/styles/app_bars.dart';
import 'package:blog_app_flutter/widgets/styles/test_styles.dart';
import 'package:blog_app_flutter/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key, required this.userToken});
  final String userToken;
  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordConfirmationController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(
        title: 'Reset Password',
        leadingF: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Text(
                'Reset your password',
                style: titleStyle(),
              ),
              const SizedBox(height: 20),
              PasswordTextField(
                textEditingController: oldPasswordController,
                display: 'Current Password',
                keyboard: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 20),
              PasswordTextField(
                textEditingController: newPasswordController,
                display: 'New Password',
                keyboard: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 20),
              PasswordTextField(
                textEditingController: newPasswordConfirmationController,
                display: 'Confirm New Password',
                keyboard: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 20),
              mainButton('Reset', context, resetPasword),
              const SizedBox(height: 20),
              forgotPasswordOption(),
            ],
          ),
        ),
      ),
    );
  }

  void resetPasword() async {
    UserHelper userHelper = UserHelper();
    String oldPass = oldPasswordController.text;
    String newPass = newPasswordController.text;
    String newPassConfirmation = newPasswordConfirmationController.text;
    if (newPass != newPassConfirmation) {
      Fluttertoast.showToast(
        msg: 'Passwords do not match',
        toastLength: Toast.LENGTH_LONG,
        textColor: Colors.red,
        backgroundColor: const Color.fromARGB(10, 255, 255, 255),
        fontSize: 16,
        gravity: ToastGravity.BOTTOM,
      );
      return;
    }
    try {
      var response =
          await userHelper.resetPassword(widget.userToken, oldPass, newPass);
      log('Response :: $response');
      if (response[1] == 200) {
        Fluttertoast.showToast(
          msg: 'Passwords reset successful',
          toastLength: Toast.LENGTH_LONG,
          textColor: accentColor,
          backgroundColor: const Color.fromARGB(10, 255, 255, 255),
          fontSize: 16,
          gravity: ToastGravity.BOTTOM,
        );
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => HomePage(userToken: widget.userToken)),
          ),
        );
      } else if (response[1] == 401) {
        Fluttertoast.showToast(
          msg: 'Incorrect Password',
          toastLength: Toast.LENGTH_LONG,
          textColor: Colors.red,
          backgroundColor: const Color.fromARGB(10, 255, 255, 255),
          fontSize: 16,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (e) {
      log('Error Caught ::$e');
    }
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
