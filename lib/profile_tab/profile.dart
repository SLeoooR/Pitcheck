import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pitcheck/intro_screens/load_screen.dart';
import 'package:pitcheck/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final prefs = snapshot.data;

          User user = User.fromJson(json.decode(prefs?.getString('userData') ?? ""));

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/avatar.json', width: 200, height: 200),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text:'I am ', style: TextStyle(fontSize: 25, )),
                      TextSpan(text: user.name , style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green)),
                    ],
                  ),
                ),
                Text('"${user.occupation}"', style: const TextStyle(fontSize: 20),),
                const SizedBox(height: 40,),
                Text('Total Pitches: ${user.totalPitches}', style: const TextStyle(fontSize: 20),),
              ],
            ),
          );
        } else {
          return const LoadScreen();
        }
      }
    );
  }
}