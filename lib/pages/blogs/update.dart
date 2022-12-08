// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:blog_app_flutter/backend/blog_helper.dart';
import 'package:blog_app_flutter/pages/home.dart';
import 'package:blog_app_flutter/widgets/styles/app_bars.dart';
import 'package:blog_app_flutter/widgets/buttons.dart';
import 'package:blog_app_flutter/widgets/styles/progress_indicator.dart';
import 'package:blog_app_flutter/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class UpdateBlog extends StatefulWidget {
  const UpdateBlog({
    super.key,
    required this.blogId,
    required this.userToken,
  });
  final blogId;
  final String userToken;
  @override
  State<UpdateBlog> createState() => _UpdateBlogState();
}

class _UpdateBlogState extends State<UpdateBlog> {
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController contentEditingController = TextEditingController();
  final BlogHelper blogHelper = BlogHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(
          title: 'Update Blog',
          leadingF: () {
            Navigator.pop(context);
            setState(() {});
          }),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
          child: FutureBuilder(
            future: blogHelper.show(widget.blogId),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                infoSetter(snapshot.data!['title'], snapshot.data!['content']);
                return Column(
                  children: [
                    textField3(titleEditingController, 'Title',
                        TextInputType.text, 50),
                    SizedBox(height: 20),
                    textField3(contentEditingController, 'Content',
                        TextInputType.text, 3000),
                    SizedBox(height: 20),
                    mainButton('Update', context, update),
                  ],
                );
              }
              return Center(child: circularProgressIndicator1());
            }),
          ),
        ),
      ),
    );
  }

  void infoSetter(String title, String content) {
    titleEditingController.text = title;
    contentEditingController.text = content;
  }

  void update() {
    blogHelper.update(titleEditingController.text,
        contentEditingController.text, widget.blogId, widget.userToken);
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: ((context) => HomePage(
              userToken: widget.userToken,
            )),
      ),
    );
    setState(() {});
  }
}
