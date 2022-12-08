// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously

import 'dart:developer';

import 'package:blog_app_flutter/backend/blog_helper.dart';
import 'package:blog_app_flutter/pages/home.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:blog_app_flutter/widgets/styles/app_bars.dart';
import 'package:blog_app_flutter/widgets/buttons.dart';
import 'package:blog_app_flutter/widgets/styles/test_styles.dart';
import 'package:blog_app_flutter/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({super.key, required this.userToken});
  final String userToken;
  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  final BlogHelper _blogHelper = BlogHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(
        title: 'Add Blog',
        leadingF: (() {
          Navigator.pop(context);
        }),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: prefer_const_constructors
              Text(
                'Post New Blog',
                style: titleStyleVar(25),
              ),
              const SizedBox(height: 15),
              textField3(titleController, 'Title', TextInputType.text, 50),
              const SizedBox(height: 10),
              textField3(
                  contentController, 'Content', TextInputType.text, 10000),
              const SizedBox(height: 10),
              mainButton('Post', context, addBlog),
            ],
          ),
        ),
      ),
    );
  }

  void addBlog() async {
    String title = titleController.text;
    String content = contentController.text;
    var response = await _blogHelper.store(title, content, widget.userToken);
    log('$response');
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: ((context) => HomePage(userToken: widget.userToken))));
  }
}
