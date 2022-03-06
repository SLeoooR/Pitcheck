import 'package:flutter/material.dart';
import 'package:pitcheck/main.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                              TextSpan(text:'Do', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green)),
                              TextSpan(text:' or do not. There is no try.', style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                      ),
                      Lottie.asset('assets/yoda.json')
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
                              onPressed: () {
                                Navigator.pushNamed(context, '/profileSetup');
                              },
                              child: const Text('GET STARTED')
                          ),
                        ),
                      )
                  )
                ]
            )
        ),
      ),
    );
  }
}
