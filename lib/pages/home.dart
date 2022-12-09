// ignore_for_file:prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:blog_app_flutter/backend/blog_helper.dart';
import 'package:blog_app_flutter/pages/blogs/add.dart';
import 'package:blog_app_flutter/widgets/blog_index_tile.dart';
import 'package:blog_app_flutter/widgets/drawer.dart';
import 'package:blog_app_flutter/widgets/styles/progress_indicator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.userToken});
  final String userToken;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BlogHelper _blogHelper = BlogHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Latest Blogs',
        ),
        leading: Builder(
          builder: ((context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu),
              )),
        ),
      ),
      body: FutureBuilder(
        future: _blogHelper.index(),
        builder: (context, snapshot) {
          log('${snapshot.connectionState}');
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return BlogTile(
                  blog: snapshot.data![snapshot.data!.length - 1 - index],
                  userToken: widget.userToken,
                );
              },
            );
          }
          return Center(child: circularProgressIndicator1());
        },
      ),
      drawer: NavDrawer(userToken: widget.userToken),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => AddBlog(
                      userToken: widget.userToken,
                    )),
              ),
            )),
        backgroundColor: Colors.transparent,
        child: Image.asset('assets/icons/circled-plus.png'),
      ),
    );
  }
}