import 'package:fanby/fan_screens/fan_check_screen/fan_check_add_note.dart';
import 'package:fanby/fan_screens/fan_check_screen/fan_check_breath.dart';
import 'package:fanby/fan_screens/fan_check_screen/fan_check_check_screen.dart';
import 'package:fanby/fan_screens/fan_check_screen/fan_check_great.dart';
import 'package:fanby/fan_screens/fan_check_screen/fan_check_massage_screen.dart';
import 'package:fanby/fan_screens/fan_check_screen/fan_check_mirror_screen.dart';
import 'package:fanby/fan_screens/fan_check_screen/fan_ckeck_up_screen.dart';
import 'package:fanby/fan_screens/fan_hello_screen.dart/fan_hello_screen_1.dart';
import 'package:fanby/fan_screens/fan_hello_screen.dart/fan_hello_screen_2.dart';
import 'package:fanby/fan_screens/fan_profile_screen/fan_profile_edit.dart';
import 'package:fanby/fan_screens/fan_profile_screen/fan_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FanProfileNavigator extends StatelessWidget {
  const FanProfileNavigator({super.key});

  @override
  Widget build(BuildContext context) => Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/fan_profile',
        observers: [HeroController()],
        onGenerateRoute: (settings) {
          if (settings.name == '/fan_profile') {
            return GetPageRoute<dynamic>(
              page: () => FanProfileScreen(),
            );
          } else if (settings.name == '/fan_profile_edit') {
            return GetPageRoute<dynamic>(
              page: () => FanProfileEditScreen(),
            );
          }
          return null;
        },
      );
}
