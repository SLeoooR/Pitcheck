import 'package:flutter/material.dart';
import 'package:pitcheck/dashboard.dart';
import 'package:pitcheck/intro_screens/intro_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'intro_screens/load_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final prefs = snapshot.data;

          if (prefs?.get('userData') == null) {
            return const IntroScreen();
          } else {
            return const Dashboard(pageNumber: 0,);
          }
        } else {
          return const LoadScreen();
        }
      },
    );
  }
}