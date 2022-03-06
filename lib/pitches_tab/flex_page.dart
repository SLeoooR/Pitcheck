import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pitcheck/main.dart';
import 'package:pitcheck/pitches_tab/timer_page.dart';

class FlexPage extends StatefulWidget {
  final String prefsKey;

  const FlexPage({Key? key, required this.prefsKey}) : super(key: key);

  @override
  State<FlexPage> createState() => _FlexPageState();
}

class _FlexPageState extends State<FlexPage> {
  late Timer _timer;
  int _timerText = 15;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec,
          (Timer timer) => setState(() {
          if (_timerText == 0) {
            timer.cancel();
          } else {
            _timerText--;
          }
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
    return Scaffold(
      body: SafeArea(
          child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text:'Flex', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red)),
                            TextSpan(text:' like there\'s no tomorrow!', style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                    Lottie.asset('assets/flex_qt.json'),
                    Text(_timerText != 0 ? '$_timerText' : 'Good luck! ☺', style: const TextStyle(fontSize: 18),),
                  ],
                ),
                Positioned(
                    bottom: 1,
                    child: Container(
                      color: Colors.black12,
                      width: deviceWidth(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: ElevatedButton(
                            onPressed: _timerText != 0 ?  null : () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => TimerPage(prefsKey: widget.prefsKey)));
                            },
                            child: const Text('START DRY RUN')
                        ),
                      ),
                    )
                )
              ]
          )
      ),
    );
  }
}
