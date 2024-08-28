import 'package:fanby/top_round_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FanCheckGreatScreen extends StatefulWidget {
  const FanCheckGreatScreen({super.key});

  @override
  State<FanCheckGreatScreen> createState() => _FanCheckGreatScreenState();
}

class _FanCheckGreatScreenState extends State<FanCheckGreatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'fan_assets/images/great.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 21,
                ),
                SizedBox(
                  height: 260,
                  width: 200,
                ),
                SizedBox(
                  height: 22,
                ),
                Expanded(
                  child: SafeArea(
                    child: TopRoundContainer(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Great job!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 14,
                                fontVariations: [FontVariation('wght', 800)],
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Take a deep breath',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 14,
                                fontVariations: [FontVariation('wght', 800)],
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'If you find something strange, schedule an appointment with your doctor',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 14,
                                fontVariations: [FontVariation('wght', 800)],
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "WARNING!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 12,
                                fontVariations: [FontVariation('wght', 400)],
                                color: Color.fromRGBO(127, 127, 127, 1),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "The application is not a medical reference book. It just helps control your health",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 12,
                                fontVariations: [FontVariation('wght', 400)],
                                color: Color.fromRGBO(127, 127, 127, 1),
                              ),
                            ),
                            SizedBox(
                              height: 28,
                            ),
                            IntrinsicWidth(
                              child: GestureDetector(
                                onTap: () {
                                  Get.offAllNamed('/fan_check_check', id: 0);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.5, horizontal: 75),
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
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'fan_assets/images/active.png',
                                        height: 20,
                                      ),
                                      Text(
                                        'DONE',
                                        style: TextStyle(
                                          fontFamily: 'Mont',
                                          fontSize: 16,
                                          fontVariations: [
                                            FontVariation('wght', 700)
                                          ],
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
