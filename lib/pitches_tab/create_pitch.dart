import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pitcheck/dashboard.dart';
import 'package:pitcheck/main.dart';
import 'package:pitcheck/models/pitch_model.dart';
import 'package:pitcheck/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatePitch extends StatefulWidget {
  const CreatePitch({Key? key}) : super(key: key);

  @override
  State<CreatePitch> createState() => _CreatePitchState();
}

class _CreatePitchState extends State<CreatePitch> {
  String _title = "";
  String _company = "";
  String _story = "";
  String _problem = "";
  String _targetAudience = "";
  String _solution = "";
  String _whyWorthIt = "";
  String _unfairAdvantage = "";
  String _finalWords = "";

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _storyController = TextEditingController();
  final TextEditingController _problemController = TextEditingController();
  final TextEditingController _targetAudienceController = TextEditingController();
  final TextEditingController _solutionController = TextEditingController();
  final TextEditingController _whyWorthItController = TextEditingController();
  final TextEditingController _unfairAdvantageController = TextEditingController();
  final TextEditingController _finalWordsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool allFieldsDone = _titleController.text != ''
        && _companyController.text != ''
        && _storyController.text != ''
        && _problemController.text != ''
        && _targetAudienceController.text != ''
        && _solutionController.text != ''
        && _whyWorthItController.text != ''
        && _unfairAdvantageController.text != ''
        && _finalWordsController.text != '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Pitch'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth(context) * .05),
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    TextField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: _titleController,
                      decoration: InputDecoration(
                        label: const Text('Title'),
                        hintText: "Your pitch title here",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onChanged: (val) => setState(() => _title = val),
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: _companyController,
                      decoration: InputDecoration(
                        label: const Text('Company'),
                        hintText: "Company or person to pitch to",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onChanged: (val) => setState(() => _company = val),
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      textCapitalization: TextCapitalization.sentences,
                      minLines: 2,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      controller: _storyController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        label: const Text('Story'),
                        hintText: "Tell a story (related) to capture audience",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onChanged: (val) => setState(() => _story = val),
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      textCapitalization: TextCapitalization.sentences,
                      minLines: 2,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      controller: _problemController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        label: const Text('Problem'),
                        hintText: "Explain the underlying problem in your pitch",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onChanged: (val) => setState(() => _problem = val),
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      textCapitalization: TextCapitalization.sentences,
                      minLines: 2,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      controller: _targetAudienceController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        label: const Text('Target Audience'),
                        hintText: "Enumerate your target audience",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onChanged: (val) => setState(() => _targetAudience = val),
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      textCapitalization: TextCapitalization.sentences,
                      minLines: 2,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      controller: _solutionController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        label: const Text('Solution'),
                        hintText: "Explain your proposed solution",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onChanged: (val) => setState(() => _solution = val),
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      textCapitalization: TextCapitalization.sentences,
                      minLines: 2,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      controller: _whyWorthItController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        label: const Text('Worthiness'),
                        hintText: "Explain why your product is worthy",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onChanged: (val) => setState(() => _whyWorthIt = val),
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      textCapitalization: TextCapitalization.sentences,
                      minLines: 2,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      controller: _unfairAdvantageController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        label: const Text('Unfair Advantage'),
                        hintText: "Enumerate what you have that others don't",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onChanged: (val) => setState(() => _unfairAdvantage = val),
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      textCapitalization: TextCapitalization.sentences,
                      minLines: 2,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      controller: _finalWordsController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        label: const Text('Final Notes'),
                        hintText: "Write ending notes here",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onChanged: (val) => setState(() => _finalWords = val),
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
              Container(
                color: Colors.black12,
                width: deviceWidth(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: ElevatedButton(
                    onPressed: !allFieldsDone ? null : () async {
                      final prefs = await SharedPreferences.getInstance();
                      Pitch pitch = Pitch(
                        title: _title,
                        company: _company,
                        story: _story,
                        problem: _problem,
                        targetAudience: _targetAudience,
                        solution: _solution,
                        whyWorthIt: _whyWorthIt,
                        unfairAdvantage: _unfairAdvantage,
                        finalWords: _finalWords,
                        icon: 'pending'
                      );

                      final keys = prefs.getKeys();

                      List<String> savedKeys = [];

                      for (var element in keys) {
                        savedKeys.add(element);
                      }

                      prefs.setString('pitchData${savedKeys.length}', json.encode(pitch));

                      User user = User.fromJson(json.decode(prefs.getString('userData') ?? ""));
                      User modifyUser = User(name: user.name, occupation: user.occupation, totalPitches: user.totalPitches + 1);

                      prefs.setString('userData', json.encode(modifyUser));

                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard(pageNumber: 0,)));
                    },
                    child: const Text('CREATE')
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