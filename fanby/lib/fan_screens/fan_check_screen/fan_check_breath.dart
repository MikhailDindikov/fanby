import 'package:fanby/top_round_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FanCheckBreathScreen extends StatefulWidget {
  const FanCheckBreathScreen({super.key});

  @override
  State<FanCheckBreathScreen> createState() => _FanCheckBreathScreenState();
}

class _FanCheckBreathScreenState extends State<FanCheckBreathScreen> {
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
                'fan_assets/images/breath.png',
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 21, top: 21),
                  child: GestureDetector(
                    onTap: () {
                      Get.back(id: 0);
                    },
                    child: Image.asset(
                      'fan_assets/images/back.png',
                      height: 48,
                      width: 48,
                    ),
                  ),
                ),
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
                        padding: EdgeInsets.symmetric(horizontal: 28),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'TAKE A DEEP BREATH',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 18,
                                fontVariations: [FontVariation('wght', 800)],
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 26,
                            ),
                            Text(
                              "When you’re ready, move on to the next page to jot down any observations",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 12,
                                fontVariations: [FontVariation('wght', 400)],
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 66,
                            ),
                            IntrinsicWidth(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/fan_check_add_note', id: 0);
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
                                      fontVariations: [
                                        FontVariation('wght', 700)
                                      ],
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
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
