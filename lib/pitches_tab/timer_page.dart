import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pitcheck/pitches_tab/validation_page.dart';

class TimerPage extends StatefulWidget {
  final String prefsKey;

  const TimerPage({Key? key, required this.prefsKey}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late Timer _timer;
  int _timerValue = 0;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec,
          (Timer timer) => setState(() {
            _timerValue++;
        },
      ),
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: InkWell(
                  child: Lottie.asset('assets/timer.json'),
                  onTap: () {
                    _timer.cancel();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ValidationPage(prefsKey: widget.prefsKey, timerValue: _timerValue,)));
                  },
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepOrange,
                ),
              ),
              const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text:'Touch', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
                      TextSpan(text:' the hourglass when you\'re done.', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
