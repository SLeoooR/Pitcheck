import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pitcheck/main.dart';
import 'package:pitcheck/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({Key? key}) : super(key: key);

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  final _formKey = GlobalKey<FormState>();
  String _userName = "";
  String _occupation = "";
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();

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
                children:  [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: deviceWidth(context) * .2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const Center(
                                child: Text(
                                  'Your name is...',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextFormField(
                                textAlign: TextAlign.center,
                                textCapitalization: TextCapitalization.words,
                                controller: _userNameController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your name',
                                  border: InputBorder.none,
                                ),
                                onSaved: (String? value) => _userName = value!,
                                onChanged: (val) => setState(() => _userName = val),
                              ),
                              const Center(
                                child: Text(
                                  'You are a/an...',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextFormField(
                                textAlign: TextAlign.center,
                                textCapitalization: TextCapitalization.words,
                                controller: _occupationController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your occupation',
                                  border: InputBorder.none,
                                ),
                                onSaved: (String? value) => _occupation = value!,
                                onChanged: (val) => setState(() => _occupation = val),
                              ),
                            ],
                          )
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
                              onPressed: _userNameController.text == '' || _occupationController.text == '' ? null : () async {
                                final prefs = await SharedPreferences.getInstance();
                                User user = User(name: _userName, occupation: _occupation, totalPitches: 0);

                                prefs.setString('userData', json.encode(user));

                                Navigator.pushNamed(context, '/dashboard');
                              },
                              child: const Text('CONTINUE')
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
