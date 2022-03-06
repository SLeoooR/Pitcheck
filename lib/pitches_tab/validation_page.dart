import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pitcheck/dashboard.dart';
import 'package:pitcheck/models/pitch_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ValidationPage extends StatefulWidget {
  final String prefsKey;
  final int timerValue;

  const ValidationPage({Key? key, required this.prefsKey, required this.timerValue}) : super(key: key);

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  String timeTaken = "";

  String intToMinSec(int value) {
    String result = "";
    int min, sec;

    min = value ~/ 60;
    sec = value - (min * 60);

    if (min == 0) {
      if (sec == 0) {
        result = "";
      } else if (sec == 1) {
        result = "$sec second";
      } else {
        result = "$sec seconds";
      }
    } else if (min == 1) {
      if (sec == 0) {
        result = "$min minute";
      } else if (sec == 1) {
        result = "$min minute and $sec second";
      } else {
        result = "$min minute and $sec seconds";
      }
    } else {
      if (sec == 0) {
        result = "$min minutes";
      } else if (sec == 1) {
        result = "$min minutes and $sec second";
      } else {
        result = "$min minutes and $sec seconds";
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    timeTaken = intToMinSec(widget.timerValue);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    child: const Icon(
                      Icons.sentiment_dissatisfied_outlined,
                      size: 70,
                      color: Colors.redAccent,
                    ),
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();

                      Pitch pitch = Pitch.fromJson(json.decode(prefs.getString(widget.prefsKey) ?? ""));

                      Pitch updatedPitch = Pitch(
                        title: pitch.title,
                        company: pitch.company,
                        story: pitch.story,
                        problem: pitch.problem,
                        targetAudience: pitch.targetAudience,
                        solution: pitch.solution,
                        whyWorthIt: pitch.whyWorthIt,
                        unfairAdvantage: pitch.unfairAdvantage,
                        finalWords: pitch.finalWords,
                        icon: 'dissatisfied',
                      );

                      prefs.setString(widget.prefsKey, json.encode(updatedPitch));

                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard(pageNumber: 0,)));
                    },
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.sentiment_neutral_outlined,
                      size: 70,
                      color: Colors.orangeAccent,
                    ),
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();

                      Pitch pitch = Pitch.fromJson(json.decode(prefs.getString(widget.prefsKey) ?? ""));

                      Pitch updatedPitch = Pitch(
                        title: pitch.title,
                        company: pitch.company,
                        story: pitch.story,
                        problem: pitch.problem,
                        targetAudience: pitch.targetAudience,
                        solution: pitch.solution,
                        whyWorthIt: pitch.whyWorthIt,
                        unfairAdvantage: pitch.unfairAdvantage,
                        finalWords: pitch.finalWords,
                        icon: 'neutral',
                      );

                      prefs.setString(widget.prefsKey, json.encode(updatedPitch));

                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard(pageNumber: 0,)));
                    },
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.sentiment_satisfied_outlined,
                      size: 70,
                      color: Colors.green,
                    ),
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();

                      Pitch pitch = Pitch.fromJson(json.decode(prefs.getString(widget.prefsKey) ?? ""));

                      Pitch updatedPitch = Pitch(
                        title: pitch.title,
                        company: pitch.company,
                        story: pitch.story,
                        problem: pitch.problem,
                        targetAudience: pitch.targetAudience,
                        solution: pitch.solution,
                        whyWorthIt: pitch.whyWorthIt,
                        unfairAdvantage: pitch.unfairAdvantage,
                        finalWords: pitch.finalWords,
                        icon: 'satisfied',
                      );

                      prefs.setString(widget.prefsKey, json.encode(updatedPitch));

                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard(pageNumber: 0,)));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text:'Validate', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
                      TextSpan(text:' your pitching performance.', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Text(timeTaken, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}