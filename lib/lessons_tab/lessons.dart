import 'package:flutter/material.dart';

class Lessons extends StatefulWidget {
  const Lessons({Key? key}) : super(key: key);

  @override
  State<Lessons> createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text:'Empty in lessons\n', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextSpan(text:'No content creator has posted yet.', style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
