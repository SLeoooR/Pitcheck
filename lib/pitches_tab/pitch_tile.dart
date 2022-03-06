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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          //set border radius more than 50% of height and width to make circle
        ),
        child: InkWell(
          onTap: () {
            print(widget.prefsKey);
            Navigator.push(context, MaterialPageRoute(builder: (context) => PitchDetails(pitch: widget.pitch, prefsKey: widget.prefsKey)));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(DateTime.now().toString(), style: const TextStyle(color: Colors.grey)),
                const Divider(
                  color: Colors.grey,
                  thickness: .5,
                ),
                ListTile(
                  leading: widget.pitch.icon == 'pending' ? const Icon(Icons.pending_outlined) : null,
                  title: Text(widget.pitch.title),
                  subtitle: Text(widget.pitch.company)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}