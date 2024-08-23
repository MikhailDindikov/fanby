import 'package:fanby/fan_controllers/fan_check_controller.dart';
import 'package:fanby/fan_models/fan_notes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FanCheckAddNote extends StatefulWidget {
  const FanCheckAddNote({super.key});

  @override
  State<FanCheckAddNote> createState() => _FanCheckAddNoteState();
}

class _FanCheckAddNoteState extends State<FanCheckAddNote> {
  String fanHintDate = '';
  final fanNotice = TextEditingController();
  final fanObserve = TextEditingController();
  final fanHowLong = TextEditingController();
  final fanPatterns = TextEditingController();
  final fanLastDay = TextEditingController();
  final RxInt breastCntType = 0.obs;
  final RxInt noticedType = 0.obs;
  final RxInt constantsType = 0.obs;
  final RxInt periodType = 0.obs;
  final fanController = Get.find<FanCheckController>();

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
  void initState() {
    fanHintDate =
        "Today’s Date: ${fanMo(DateTime.now().month)} ${DateTime.now().day}, ${DateTime.now().year}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Please answer a few questions about what you observed:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Mont',
                      fontSize: 18,
                      fontVariations: [FontVariation('wght', 800)],
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 47,
                ),
                IgnorePointer(
                  child: FatTF(
                    fanCt: TextEditingController(),
                    fanHint: fanHintDate,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "What did you notice, and how did it feel or look?",
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 16,
                    fontVariations: [FontVariation('wght', 700)],
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                FatTF(
                  fanCt: fanNotice,
                  fanHint: 'Type your response here',
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Where did you observe it?",
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 16,
                    fontVariations: [FontVariation('wght', 700)],
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                FatTF(
                  fanCt: fanObserve,
                  fanHint: 'Type your response here',
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Is it present in both breasts or just one?",
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 16,
                    fontVariations: [FontVariation('wght', 700)],
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Obx(
                  () => FanBtn(
                    isFanAct: breastCntType.value == 0,
                    fanLabel: 'Both breasts',
                    onTap: () {
                      breastCntType.value = 0;
                    },
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Obx(
                  () => FanBtn(
                    isFanAct: breastCntType.value == 1,
                    fanLabel: 'Just one breast',
                    onTap: () {
                      breastCntType.value = 1;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Have you noticed this before?",
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 16,
                    fontVariations: [FontVariation('wght', 700)],
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Obx(
                  () => FanBtn(
                    isFanAct: noticedType.value == 0,
                    fanLabel: 'Yes',
                    onTap: () {
                      noticedType.value = 0;
                    },
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Obx(
                  () => FanBtn(
                    isFanAct: noticedType.value == 1,
                    fanLabel: 'No',
                    onTap: () {
                      noticedType.value = 1;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "If yes, when? How long have you been aware of it?",
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 16,
                    fontVariations: [FontVariation('wght', 700)],
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                FatTF(
                  fanCt: fanHowLong,
                  fanHint: 'Type your response here',
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Is it constant, or does it come and go?",
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 16,
                    fontVariations: [FontVariation('wght', 700)],
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Obx(
                  () => FanBtn(
                    isFanAct: constantsType.value == 0,
                    fanLabel: 'Constant',
                    onTap: () {
                      constantsType.value = 0;
                    },
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Obx(
                  () => FanBtn(
                    isFanAct: constantsType.value == 1,
                    fanLabel: 'Comes and goes',
                    onTap: () {
                      constantsType.value = 1;
                    },
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Obx(
                  () => FanBtn(
                    isFanAct: constantsType.value == 2,
                    fanLabel: 'Unsure',
                    onTap: () {
                      constantsType.value = 2;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "If it comes and goes, have you noticed any patterns?",
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 16,
                    fontVariations: [FontVariation('wght', 700)],
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                FatTF(
                  fanCt: fanPatterns,
                  fanHint: 'Type your response here',
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Are you currently on your period?",
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 16,
                    fontVariations: [FontVariation('wght', 700)],
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Obx(
                  () => FanBtn(
                    isFanAct: periodType.value == 0,
                    fanLabel: 'Yes',
                    onTap: () {
                      periodType.value = 0;
                    },
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Obx(
                  () => FanBtn(
                    isFanAct: periodType.value == 1,
                    fanLabel: 'No',
                    onTap: () {
                      periodType.value = 1;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "If no, when was the last day of your most recent period?",
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 16,
                    fontVariations: [FontVariation('wght', 700)],
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                FatTF(
                  fanCt: fanLastDay,
                  fanHint: 'Type your response here',
                ),
                SizedBox(
                  height: 47,
                ),
                Center(
                  child: IntrinsicWidth(
                    child: GestureDetector(
                      onTap: () async {
                        if (fanNotice.text.isEmpty ||
                            fanObserve.text.isEmpty ||
                            (noticedType.value == 0 &&
                                fanHowLong.text.isEmpty) ||
                            (constantsType.value == 1 &&
                                fanPatterns.text.isEmpty) ||
                            (periodType.value == 1 &&
                                fanLastDay.text.isEmpty)) {
                          Get.showSnackbar(GetSnackBar(
                            duration: Duration(milliseconds: 1500),
                            messageText: Text(
                              'Please fill the form!',
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 18,
                                fontVariations: [FontVariation('wght', 800)],
                                color: Colors.black,
                              ),
                            ),
                            backgroundColor: Colors.white,
                          ));
                        } else {
                          await GetStorage().write('lastCheck', DateTime.now().toIso8601String());
                          fanController.addNote(
                            FanNotes(
                              id: 0,
                              noteDate: DateTime.now(),
                              notice: fanNotice.text,
                              observe: fanObserve.text,
                              breastType: breastCntType.value,
                              noticedType: noticedType.value,
                              howLong: fanHowLong.text,
                              constantsType: constantsType.value,
                              patternts: fanPatterns.text,
                              periodType: periodType.value,
                              period: fanLastDay.text,
                            ),
                          );
                          Get.toNamed('/fan_check_great', id: 0);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.5, horizontal: 75),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(0, 151, 209, 1),
                              Color.fromRGBO(30, 133, 255, 1),
                              Color.fromRGBO(40, 196, 255, 1),
                            ],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                          ),
                        ),
                        child: Text(
                          'NEXT',
                          style: TextStyle(
                            fontFamily: 'Mont',
                            fontSize: 20,
                            fontVariations: [FontVariation('wght', 700)],
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FatTF extends StatelessWidget {
  final String fanHint;
  final TextEditingController fanCt;
  const FatTF({super.key, required this.fanHint, required this.fanCt});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fanCt,
      decoration: InputDecoration(
        hintText: fanHint,
        hintStyle: TextStyle(
          fontFamily: 'Mont',
          fontSize: 12,
          fontVariations: [FontVariation('wght', 400)],
          color: Colors.black.withOpacity(0.4),
        ),
        border: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black)),
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black)),
        disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black)),
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black)),
      ),
    );
  }
}

class FanBtn extends StatelessWidget {
  final bool isFanAct;
  final String fanLabel;
  final void Function() onTap;
  const FanBtn(
      {super.key,
      required this.isFanAct,
      required this.fanLabel,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            isFanAct
                ? 'fan_assets/images/active.png'
                : 'fan_assets/images/inactive.png',
            height: 30,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            fanLabel,
            style: TextStyle(
              fontFamily: 'Mont',
              fontSize: 14,
              fontVariations: [FontVariation('wght', 400)],
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
