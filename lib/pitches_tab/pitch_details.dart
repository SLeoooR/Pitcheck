import 'package:flutter/material.dart';
import 'package:pitcheck/pitches_tab/flex_page.dart';
import 'package:pitcheck/main.dart';
import 'package:pitcheck/models/pitch_model.dart';
class PitchDetails extends StatefulWidget {
  final Pitch pitch;
  final String prefsKey;

  const PitchDetails({Key? key, required this.pitch, required this.prefsKey}) : super(key: key);

  @override
  State<PitchDetails> createState() => _PitchDetailsState();
}

class _PitchDetailsState extends State<PitchDetails> {
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
    _titleController.text = widget.pitch.title;
    _companyController.text = widget.pitch.company;
    _storyController.text = widget.pitch.story;
    _problemController.text = widget.pitch.problem;
    _targetAudienceController.text = widget.pitch.targetAudience;
    _solutionController.text = widget.pitch.solution;
    _whyWorthItController.text = widget.pitch.whyWorthIt;
    _unfairAdvantageController.text = widget.pitch.unfairAdvantage;
    _finalWordsController.text = widget.pitch.finalWords;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pitch Details'),
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
                      readOnly: true,
                      controller: _titleController,
                      decoration: InputDecoration(
                        label: const Text('Title'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      readOnly: true,
                      controller: _companyController,
                      decoration: InputDecoration(
                        label: const Text('Company'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      readOnly: true,
                      minLines: 2,
                      maxLines: null,
                      controller: _storyController,
                      decoration: InputDecoration(
                        label: const Text('Story'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      readOnly: true,
                      minLines: 2,
                      maxLines: null,
                      controller: _problemController,
                      decoration: InputDecoration(
                        label: const Text('Problem'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      readOnly: true,
                      minLines: 2,
                      maxLines: null,
                      controller: _targetAudienceController,
                      decoration: InputDecoration(
                        label: const Text('Target Audience'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      readOnly: true,
                      minLines: 2,
                      maxLines: null,
                      controller: _solutionController,
                      decoration: InputDecoration(
                        label: const Text('Solution'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      readOnly: true,
                      minLines: 2,
                      maxLines: null,
                      controller: _whyWorthItController,
                      decoration: InputDecoration(
                        label: const Text('Worthiness'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      readOnly: true,
                      minLines: 2,
                      maxLines: null,
                      controller: _unfairAdvantageController,
                      decoration: InputDecoration(
                        label: const Text('Unfair Advantage'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      readOnly: true,
                      minLines: 2,
                      maxLines: null,
                      controller: _finalWordsController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        label: const Text('Final Notes'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
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
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FlexPage(prefsKey: widget.prefsKey)));
                    },
                    child: const Text('DO DRY RUN')
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