import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pitcheck/intro_screens/load_screen.dart';
import 'package:pitcheck/models/pitch_model.dart';
import 'package:pitcheck/pitches_tab/pitch_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pitches extends StatefulWidget {
  const Pitches({Key? key}) : super(key: key);

  @override
  State<Pitches> createState() => _PitchesState();
}

class _PitchesState extends State<Pitches> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final prefs = snapshot.data;
            final keys = prefs?.getKeys();

            List<String> savedKeys = [];

            keys?.forEach((element) {
              savedKeys.add(element);
            });

            savedKeys.removeWhere((element) => element == 'userData');

            if (savedKeys.isNotEmpty) {
              return SingleChildScrollView(
                child: ListView.builder(
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: savedKeys.length,
                  itemBuilder: (context, index) {
                    String prefsKey = 'pitchData${index + 1}';
                    Pitch pitch = Pitch.fromJson(json.decode(prefs?.getString(prefsKey) ?? ""));
                    return PitchTile(pitch: pitch, prefsKey: prefsKey);
                  },
                )
              );
            } else {
              return const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text:'Empty in pitches\n', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      TextSpan(text:'Create a pitch to start practicing.', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
              );
            }
          } else {
            return const LoadScreen();
          }
        }
      ),
    );
  }
}