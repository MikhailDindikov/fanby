import 'package:fanby/fan_screens/fan_check_screen/fan_check_add_note.dart';
import 'package:fanby/fan_screens/fan_check_screen/fan_check_breath.dart';
import 'package:fanby/fan_screens/fan_check_screen/fan_check_check_screen.dart';
import 'package:fanby/fan_screens/fan_check_screen/fan_check_great.dart';
import 'package:fanby/fan_screens/fan_check_screen/fan_check_massage_screen.dart';
import 'package:fanby/fan_screens/fan_check_screen/fan_check_mirror_screen.dart';
import 'package:fanby/fan_screens/fan_check_screen/fan_ckeck_up_screen.dart';
import 'package:fanby/fan_screens/fan_hello_screen.dart/fan_hello_screen_1.dart';
import 'package:fanby/fan_screens/fan_hello_screen.dart/fan_hello_screen_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FanCheckNavigator extends StatelessWidget {
  const FanCheckNavigator({super.key});

  @override
  Widget build(BuildContext context) => Navigator(
        key: Get.nestedKey(0),
        initialRoute: '/fan_check_check',
        observers: [HeroController()],
        onGenerateRoute: (settings) {
          if (settings.name == '/fan_check_check') {
            return GetPageRoute<dynamic>(
              page: () => FanHelloScreen2(),
            );
          } else if (settings.name == '/fan_check_mirror') {
            return GetPageRoute<dynamic>(
              page: () => FanCheckMirrorScreen(),
            );
          } else if (settings.name == '/fan_check_mas') {
            return GetPageRoute<dynamic>(
              page: () => FanCheckMassageScreen(),
            );
          } else if (settings.name == '/fan_check_up') {
            return GetPageRoute<dynamic>(
              page: () => FanCheckUpScreen(),
            );
          } else if (settings.name == '/fan_check_check1') {
            return GetPageRoute<dynamic>(
              page: () => FanCheckCheckScreen(),
            );
          } else if (settings.name == '/fan_check_breath') {
            return GetPageRoute<dynamic>(
              page: () => FanCheckBreathScreen(),
            );
          } else if (settings.name == '/fan_check_add_note') {
            return GetPageRoute<dynamic>(
              page: () => FanCheckAddNote(),
            );
          } else if (settings.name == '/fan_check_great') {
            return GetPageRoute<dynamic>(
              page: () => FanCheckGreatScreen(),
            );
          }
          return null;
        },
      );
}
