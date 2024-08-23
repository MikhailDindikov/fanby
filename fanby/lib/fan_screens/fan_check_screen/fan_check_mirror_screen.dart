import 'dart:async';

import 'package:fanby/top_round_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FanCheckMirrorScreen extends StatefulWidget {
  const FanCheckMirrorScreen({super.key});

  @override
  State<FanCheckMirrorScreen> createState() => _FanCheckMirrorScreenState();
}

class _FanCheckMirrorScreenState extends State<FanCheckMirrorScreen> {
  final fanController = PageController();
  final RxInt fanPage = 0.obs;

  @override
  void initState() {
    super.initState();
    fanController.addListener(() {
      fanPage.value = (fanController.page! + 0.45).toInt();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer.periodic(Duration(milliseconds: 2000), (timer) {
        if (fanPage.value == 0) {
          fanController.animateToPage(1,
              duration: Duration(milliseconds: 300), curve: Curves.linear);
        } else {
          fanController.animateToPage(0,
              duration: Duration(milliseconds: 300), curve: Curves.linear);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(40, 196, 255, 1),
            Color.fromRGBO(0, 151, 209, 1),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          child: SafeArea(
            bottom: false,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topLeft,
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
                Column(
                  children: [
                    SizedBox(
                      height: 21,
                    ),
                    IgnorePointer(
                      child: SizedBox(
                        height: 260,
                        width: 200,
                        child: PageView(
                          controller: fanController,
                          children: [
                            Image.asset(
                              'fan_assets/images/mirror1.png',
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'fan_assets/images/mirror2.png',
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => AnimatedContainer(
                            duration: Duration(
                              milliseconds: 300,
                            ),
                            height: 5,
                            width: fanPage.value == 0 ? 31 : 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.5),
                              color: fanPage.value == 0
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.6),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Obx(
                          () => AnimatedContainer(
                            duration: Duration(
                              milliseconds: 300,
                            ),
                            height: 5,
                            width: fanPage.value == 1 ? 31 : 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.5),
                              color: fanPage.value == 1
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.6),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Expanded(
                      child: TopRoundContainer(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 28),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'MIRROR MIRROR',
                                style: TextStyle(
                                  fontFamily: 'Mont',
                                  fontSize: 18,
                                  fontVariations: [FontVariation('wght', 800)],
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 23,
                              ),
                              Text(
                                "Stand in front of a mirror and examine your chest",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Mont',
                                  fontSize: 12,
                                  fontVariations: [FontVariation('wght', 400)],
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Raise your hands above your head, then place them on your hips",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Mont',
                                  fontSize: 12,
                                  fontVariations: [FontVariation('wght', 400)],
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Move around to view every part of your chest, including your side profile and the area directly underneath your breasts",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Mont',
                                  fontSize: 12,
                                  fontVariations: [FontVariation('wght', 400)],
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 23,
                              ),
                              IntrinsicWidth(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/fan_check_mas', id: 0);
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
