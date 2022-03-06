import 'package:flutter/material.dart';
import 'package:pitcheck/pitches_tab/pitch_details.dart';
import 'package:pitcheck/models/pitch_model.dart';

class PitchTile extends StatefulWidget {
  final Pitch pitch;
  final String prefsKey;

  const PitchTile({
    Key? key,
    required this.pitch,
    required this.prefsKey
  }) : super(key: key);

  @override
  State<PitchTile> createState() => _PitchTileState();
}

class _PitchTileState extends State<PitchTile> {
  @override
  Widget build(BuildContext context) {
    Widget? leadingListTile =
      widget.pitch.icon == 'pending' ? const Icon(Icons.pending_outlined, color: Colors.black,) :
      widget.pitch.icon == 'dissatisfied' ? const Icon(Icons.sentiment_dissatisfied_outlined, color: Colors.black,) :
      widget.pitch.icon == 'neutral' ? const Icon(Icons.sentiment_neutral_outlined, color: Colors.black,) :
      widget.pitch.icon == 'satisfied' ? const Icon(Icons.sentiment_satisfied_outlined, color: Colors.black,) : null;

    Color? cardColor =
      widget.pitch.icon == 'pending' ? Colors.lightBlueAccent :
      widget.pitch.icon == 'dissatisfied' ? Colors.redAccent :
      widget.pitch.icon == 'neutral' ? Colors.yellowAccent :
      widget.pitch.icon == 'satisfied' ? Colors.lightGreen: null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        color: cardColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          //set border radius more than 50% of height and width to make circle
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PitchDetails(pitch: widget.pitch, prefsKey: widget.prefsKey)));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(DateTime.now().toString()),
                const Divider(
                  color: Colors.black,
                  thickness: .5,
                ),
                ListTile(
                  leading: leadingListTile,
                  title: Text(widget.pitch.title, style: const TextStyle(color: Colors.black),),
                  subtitle: Text(widget.pitch.company, style: const TextStyle(color: Colors.black),)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}