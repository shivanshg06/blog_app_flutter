// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:blog_app_flutter/backend/user_helper.dart';
import 'package:blog_app_flutter/screens/onboarding.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({super.key, required this.userToken});
  final String userToken;
  final UserHelper userHelper = UserHelper();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: accentColor,
            ),
            child: Text(
              'User Name',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person, size: 25, color: accentColor),
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 17),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 25, color: accentColor),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 17),
            ),
          ),
          ListTile(
            leading: Icon(Icons.book, size: 25, color: accentColor),
            title: Text(
              'Legal Information',
              style: TextStyle(fontSize: 17),
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, size: 25, color: accentColor),
            title: Text(
              'Log Out',
              style: TextStyle(fontSize: 17),
            ),
            onTap: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              userHelper.logout(userToken);
              sharedPreferences.remove('userToken');
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ((context) => OnboardingScreen()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}