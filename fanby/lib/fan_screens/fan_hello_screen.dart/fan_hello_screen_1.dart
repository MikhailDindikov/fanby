import 'package:fanby/fan_controllers/fan_check_controller.dart';
import 'package:fanby/fan_controllers/fan_profile_controller.dart';
import 'package:fanby/fan_screens/fan_hello_screen.dart/fan_hello_screen_2.dart';
import 'package:fanby/fan_screens/fan_main_screen/fan_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FanHelloScreen1 extends StatefulWidget {
  const FanHelloScreen1({super.key});

  @override
  State<FanHelloScreen1> createState() => _FanHelloScreen1State();
}

class _FanHelloScreen1State extends State<FanHelloScreen1> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FanProfileController>(
      builder: (controller) => Container(
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
        child: GetBuilder<FanCheckController>(builder: (checkController) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Text(
                                'Welcome,\n${controller.fanName}!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Mont',
                                  fontSize: 36,
                                  fontVariations: [FontVariation('wght', 700)],
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: Get.width - 28 * 2,
                            width: Get.width - 28 * 2,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: controller.fanImg == null
                                ? Image.asset(
                                    'fan_assets/images/avatar.png',
                                    fit: BoxFit.cover,
                                  )
                                : Image.memory(
                                    controller.fanImg!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: IntrinsicWidth(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => FanMainScreen(),
                                  );
                                },
                                child: Container(
                                  height: 45,
                                  margin: EdgeInsets.only(bottom: 30),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    'START YOURSELF-CHECK',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Mont',
                                      fontSize: 14,
                                      fontVariations: [
                                        FontVariation('wght', 700)
                                      ],
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
