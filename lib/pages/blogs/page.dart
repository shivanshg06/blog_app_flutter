// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:blog_app_flutter/backend/blog_helper.dart';
import 'package:blog_app_flutter/backend/user_helper.dart';
import 'package:blog_app_flutter/pages/blogs/update.dart';
import 'package:blog_app_flutter/pages/home.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:blog_app_flutter/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({
    super.key,
    required this.blogId,
    required this.title_blog,
    required this.userToken,
  });
  final blogId;
  final String title_blog;
  final String userToken;
  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final BlogHelper blogHelper = BlogHelper();
  final UserHelper userHelper = UserHelper();
  bool isAuthorised = false;
  @override
  void initState() {
    authorisation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title_blog,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          Visibility(
            visible: isAuthorised,
            child: IconButton(
              onPressed: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => UpdateBlog(
                        blogId: widget.blogId, userToken: widget.userToken)),
                  ),
                );
              }),
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: FutureBuilder(
            future: blogHelper.show(widget.blogId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.data['title'],
                      style: TextStyle(
                        fontSize: 35,
                        color: accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      snapshot.data['content'],
                    ),
                  ],
                );
              }
              return circularProgressIndicator1();
            },
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: isAuthorised,
        child: FloatingActionButton(
          onPressed: () {
            blogHelper.destroy(
              widget.blogId,
              widget.userToken,
            );
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => HomePage(userToken: widget.userToken)),
              ),
            );
          },
          backgroundColor: Colors.transparent,
          child: Image.asset('assets/icons/circled-x.png'),
        ),
      ),
    );
  }

  void authorisation() async {
    var blog_user_id = await blogHelper.getUser(widget.blogId);
    var auth_user_id = await userHelper.getId(widget.userToken);
    log('$blog_user_id  ${auth_user_id['id']}');
    if (blog_user_id == auth_user_id['id']) {
      isAuthorised = true;
      setState(() {});
    }
  }
}
