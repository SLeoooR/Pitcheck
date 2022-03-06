import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pitcheck/dashboard.dart';
import 'package:pitcheck/main.dart';
import 'package:pitcheck/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String _name = "";
  String _occupation = "";
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceWidth(context) * .05, vertical: deviceHeight(context) * .05),
              child: Column(
                children: [
                  TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: _nameController,
                    decoration: InputDecoration(
                      label: const Text('Name'),
                      hintText: "Your name here",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onChanged: (val) => setState(() => _name = val),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: _occupationController,
                    decoration: InputDecoration(
                      label: const Text('Occupation'),
                      hintText: "Your occupation or title here",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onChanged: (val) => setState(() => _occupation = val),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 1,
                child: Container(
                  color: Colors.black12,
                  width: deviceWidth(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: ElevatedButton(
                        onPressed: _nameController.text == '' || _occupationController.text == '' ? null : () async {
                          final prefs = await SharedPreferences.getInstance();

                          User user = User.fromJson(json.decode(prefs.getString('userData') ?? ""));
                          User updatedUser = User(name: _name, occupation: _occupation, totalPitches: user.totalPitches);

                          prefs.setString('userData', json.encode(updatedUser));

                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard(pageNumber: 2,)));
                        },
                        child: const Text('SAVE CHANGES')
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
