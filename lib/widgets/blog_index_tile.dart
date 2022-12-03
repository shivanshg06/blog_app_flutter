// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, prefer_const_constructors

import 'package:blog_app_flutter/pages/blogs/page.dart';
import 'package:flutter/material.dart';

class BlogTile extends StatefulWidget {
  const BlogTile({super.key, required this.blog, required this.userToken});
  final blog;
  final String userToken;
  @override
  State<BlogTile> createState() => _BlogTileState();
}

class _BlogTileState extends State<BlogTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        blogPagefunction(widget.blog['id'].toString(),
            widget.blog['title'].toString(), widget.userToken);
      },
      title: Text(
        widget.blog['title'].toString(),
      ),
      subtitle: Text(
        widget.blog['content'].toString().length > 20
            ? widget.blog['content'].toString().substring(0, 20)
            : widget.blog['content'].toString(),
      ),
      leading: Image.asset(
        'assets/icons/command.png',
        scale: 1.3,
      ),
    );
  }

  void blogPagefunction(String id, String title, String userToken) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => BlogPage(
              blogId: id,
              title_blog: title.length > 30 ? title.substring(0, 30) : title,
              userToken: userToken,
            )),
      ),
    );
  }
}
