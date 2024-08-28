import 'package:fanby/fan_controllers/fan_profile_controller.dart';
import 'package:fanby/fan_screens/fan_sysytem_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FanSettingsScreen extends StatefulWidget {
  const FanSettingsScreen({super.key});

  @override
  State<FanSettingsScreen> createState() => _FanSettingsScreenState();
}

class _FanSettingsScreenState extends State<FanSettingsScreen> {
  final profileController = Get.find<FanProfileController>();
  final RxBool fanPur = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'Mont',
            fontSize: 18,
            fontVariations: [FontVariation('wght', 800)],
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => FanSystemScreen(
                        fancontrollerWT: 'Privacy Policy',
                      ));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.symmetric(vertical: 10.5),
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
                    'Privacy Policy',
                    style: TextStyle(
                      fontFamily: 'Mont',
                      fontSize: 20,
                      fontVariations: [FontVariation('wght', 700)],
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => FanSystemScreen(
                        fancontrollerWT: 'Terms of Use',
                      ));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.symmetric(vertical: 10.5),
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
                    'Terms of Use',
                    style: TextStyle(
                      fontFamily: 'Mont',
                      fontSize: 20,
                      fontVariations: [FontVariation('wght', 700)],
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => FanSystemScreen(
                        fancontrollerWT: 'Support',
                      ));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.symmetric(vertical: 10.5),
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
                    'Support',
                    style: TextStyle(
                      fontFamily: 'Mont',
                      fontSize: 20,
                      fontVariations: [FontVariation('wght', 700)],
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
