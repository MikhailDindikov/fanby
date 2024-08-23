import 'package:fanby/fan_models/fan_notes.dart';
import 'package:flutter/material.dart';

class FanCalendarCard extends StatelessWidget {
  final FanNotes fanModel;
  const FanCalendarCard({super.key, required this.fanModel});

  String fanMo(int famM) {
    if (famM == 1) {
      return 'January';
    } else if (famM == 2) {
      return 'February';
    } else if (famM == 3) {
      return 'March';
    } else if (famM == 4) {
      return 'April';
    } else if (famM == 5) {
      return 'May';
    } else if (famM == 6) {
      return 'June';
    } else if (famM == 7) {
      return 'July';
    } else if (famM == 8) {
      return 'August';
    } else if (famM == 9) {
      return 'September';
    } else if (famM == 10) {
      return 'October';
    } else if (famM == 11) {
      return 'November';
    } else {
      return 'December';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${fanMo(fanModel.noteDate.month)} ${fanModel.noteDate.day}, ${fanModel.noteDate.year}',
          style: TextStyle(
            fontFamily: 'Mont',
            fontSize: 16,
            fontVariations: [FontVariation('wght', 700)],
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          '• What did you notice, and how did it feel or look?',
          style: TextStyle(
            fontFamily: 'Mont',
            fontSize: 14,
            fontVariations: [FontVariation('wght', 700)],
            color: Colors.black,
          ),
        ),
        Text(
          '- ' + fanModel.notice,
          style: TextStyle(
            fontFamily: 'Mont',
            fontSize: 14,
            fontVariations: [FontVariation('wght', 700)],
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 14,
        ),
        Text(
          '• Where did you observe it?',
          style: TextStyle(
            fontFamily: 'Mont',
            fontSize: 14,
            fontVariations: [FontVariation('wght', 700)],
            color: Colors.black,
          ),
        ),
        Text(
          '- ' + fanModel.observe,
          style: TextStyle(
            fontFamily: 'Mont',
            fontSize: 14,
            fontVariations: [FontVariation('wght', 700)],
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 14,
        ),
        Text(
          '• Is it present in both breasts or just one: ${fanModel.breastType == 0 ? 'Both breasts' : 'Just one breast'}',
          style: TextStyle(
            fontFamily: 'Mont',
            fontSize: 14,
            fontVariations: [FontVariation('wght', 700)],
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 14,
        ),
        Text(
          '• Have you noticed this before?: ${fanModel.noticedType == 0 ? 'Yes' : 'No'}',
          style: TextStyle(
            fontFamily: 'Mont',
            fontSize: 14,
            fontVariations: [FontVariation('wght', 700)],
            color: Colors.black,
          ),
        ),
        if (fanModel.noticedType == 0)
          SizedBox(
            height: 14,
          ),
        if (fanModel.noticedType == 0)
          Text(
            '• If yes, when? How long have you been aware of it?',
            style: TextStyle(
              fontFamily: 'Mont',
              fontSize: 14,
              fontVariations: [FontVariation('wght', 700)],
              color: Colors.black,
            ),
          ),
        if (fanModel.noticedType == 0)
          Text(
            '- ' + fanModel.howLong,
            style: TextStyle(
              fontFamily: 'Mont',
              fontSize: 14,
              fontVariations: [FontVariation('wght', 700)],
              color: Colors.black,
            ),
          ),
        SizedBox(
          height: 14,
        ),
        Text(
          '• Is it constant, or does it come and go: ${fanModel.constantsType == 0 ? 'Constant' : fanModel.constantsType == 1 ? 'Comes and goes' : 'Unsure'}',
          style: TextStyle(
            fontFamily: 'Mont',
            fontSize: 14,
            fontVariations: [FontVariation('wght', 700)],
            color: Colors.black,
          ),
        ),
        if (fanModel.noticedType == 1)
          SizedBox(
            height: 14,
          ),
        if (fanModel.noticedType == 1)
          Text(
            '• If it comes and goes, have you noticed any patterns?',
            style: TextStyle(
              fontFamily: 'Mont',
              fontSize: 14,
              fontVariations: [FontVariation('wght', 700)],
              color: Colors.black,
            ),
          ),
        if (fanModel.noticedType == 1)
          Text(
            '- ' + fanModel.patternts,
            style: TextStyle(
              fontFamily: 'Mont',
              fontSize: 14,
              fontVariations: [FontVariation('wght', 700)],
              color: Colors.black,
            ),
          ),
        SizedBox(
          height: 14,
        ),
        Text(
          '• Are you currently on your period: ${fanModel.periodType == 0 ? 'Yes' : 'No'}',
          style: TextStyle(
            fontFamily: 'Mont',
            fontSize: 14,
            fontVariations: [FontVariation('wght', 700)],
            color: Colors.black,
          ),
        ),
        if (fanModel.periodType == 1)
          SizedBox(
            height: 14,
          ),
        if (fanModel.periodType == 1)
          Text(
            '• If no, when was the last day of your most recent period?',
            style: TextStyle(
              fontFamily: 'Mont',
              fontSize: 14,
              fontVariations: [FontVariation('wght', 700)],
              color: Colors.black,
            ),
          ),
        if (fanModel.periodType == 1)
          Text(
            '- ' + fanModel.period,
            style: TextStyle(
              fontFamily: 'Mont',
              fontSize: 14,
              fontVariations: [FontVariation('wght', 700)],
              color: Colors.black,
            ),
          ),
        SizedBox(
          height: 28,
        ),
      ],
    );
  }
}
