// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_element, use_build_context_synchronously

import 'dart:developer';

import 'package:blog_app_flutter/backend/user_helper.dart';
import 'package:blog_app_flutter/pages/profile/set_profile.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:blog_app_flutter/widgets/styles/app_bars.dart';
import 'package:blog_app_flutter/widgets/buttons.dart';
import 'package:blog_app_flutter/widgets/styles/test_styles.dart';
import 'package:blog_app_flutter/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class SecurityQuestion extends StatefulWidget {
  const SecurityQuestion({super.key, required this.userToken});
  final String userToken;

  @override
  State<SecurityQuestion> createState() => _SecurityQuestionState();
}

class _SecurityQuestionState extends State<SecurityQuestion> {
  final UserHelper _userHelper = UserHelper();
  String _dropdownValue = '';

  TextEditingController answerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hiddenAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: <Widget>[
              Text(
                'Set Security Question',
                textAlign: TextAlign.left,
                style: titleStyle(),
              ),
              const SizedBox(height: 10),
              const Text(
                'This will allow us to protect your\naccount better.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 20),
              DropdownButton(
                menuMaxHeight: null,
                iconEnabledColor: accentColor,
                hint: const Text('Select a Question'),
                items: [
                  DropdownMenuItem(
                    value: 'Where did you do your schooling?',
                    child: Text('Where did you do your schooling?',
                        style: _textStyle()),
                  ),
                  DropdownMenuItem(
                    value: 'What was the name of your first pet?',
                    child: Text('What was the name of your first pet?',
                        style: _textStyle()),
                  ),
                  DropdownMenuItem(
                    value: 'In what city were you born?',
                    child: Text('In what city were you born?',
                        style: _textStyle()),
                  ),
                  DropdownMenuItem(
                    value: 'What was your favorite food as a child?',
                    child: Text('What was your favorite food as a child?',
                        style: _textStyle()),
                  ),
                  DropdownMenuItem(
                    value: 'What was your childhood nickname?',
                    child: Text('What was your childhood nickname?',
                        style: _textStyle()),
                  ),
                  DropdownMenuItem(
                    value: 'In what city and country do you want to retire?',
                    child: Text(
                        'In what city and country do you want to retire?',
                        style: _textStyle()),
                  ),
                  DropdownMenuItem(
                    value: 'What time of the day were you born?',
                    child: Text('What time of the day were you born?',
                        style: _textStyle()),
                  ),
                  DropdownMenuItem(
                    value: 'What was your dream job as a child?',
                    child: Text('What was your dream job as a child?',
                        style: _textStyle()),
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    _dropdownValue = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Your selected question is:',
                textAlign: TextAlign.center,
                style: TextStyle(color: accentColor, fontSize: 15),
              ),
              const SizedBox(height: 6),
              Text(
                _dropdownValue == '' ? 'No Question Selected' : _dropdownValue,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 20),
              textField1(answerController, 'Answer', TextInputType.text),
              const SizedBox(height: 20),
              mainButton(
                'Set Security',
                context,
                (() {
                  String answer = answerController.text;
                  log('$_dropdownValue $answer');
                  setInfo(widget.userToken, _dropdownValue, answer);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _textStyle() {
    return const TextStyle(
      color: Colors.white,
    );
  }

  void setInfo(String userToken, String question, String answer) async {
    log('message');
    await _userHelper.setSecurity(userToken, question, answer);
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: ((context) => Setprofile(userToken: userToken)),
      ),
    );
  }
}
