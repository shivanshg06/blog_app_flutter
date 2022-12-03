import 'package:blog_app_flutter/widgets/app_bars.dart';
import 'package:flutter/material.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({super.key, required this.userToken});
  final String userToken;
  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(
          title: 'Shiv\'s Blogs',
          leadingF: (() {
            Navigator.pop(context);
          })),
    );
  }
}
