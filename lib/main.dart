import 'package:flutter/material.dart';
import 'package:pitcheck/pitches_tab/create_pitch.dart';
import 'package:pitcheck/dashboard.dart';
import 'package:pitcheck/profile_tab/edit_profile.dart';
import 'package:pitcheck/intro_screens/intro_screen.dart';
import 'package:pitcheck/intro_screens/load_screen.dart';
import 'package:pitcheck/intro_screens/profile_setup.dart';
import 'package:pitcheck/wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pitcheck',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const LoadScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const LoadScreen());
          case '/wrapper':
            return MaterialPageRoute(builder: (context) => const Wrapper());
          case '/introScreen':
            return MaterialPageRoute(builder: (context) => const IntroScreen());
          case '/profileSetup':
            return MaterialPageRoute(builder: (context) => const ProfileSetup());
          case '/dashboard':
            return MaterialPageRoute(builder: (context) => const Dashboard(pageNumber: 0,));
          case '/editProfile':
            return MaterialPageRoute(builder: (context) => const EditProfile());
          case '/createPitch':
            return MaterialPageRoute(builder: (context) => const CreatePitch());
          default:
            return null;
        }
      }
    );
  }
}

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;