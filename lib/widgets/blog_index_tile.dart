// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'package:flutter/material.dart';

class BlogTile extends StatefulWidget {
  const BlogTile({super.key, required this.blog});
  final blog;
  @override
  State<BlogTile> createState() => _BlogTileState();
}

class _BlogTileState extends State<BlogTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        title: Text(
          widget.blog['title'].toString(),
        ),
        subtitle: Text(
          widget.blog['content'].toString().substring(0, 20),
        ),
        leading: Image.asset(
          'assets/icons/heart-fun.png',
          scale: 1.3,
        ),
      ),
    );
  }
}
