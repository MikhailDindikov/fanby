import 'package:fanby/fan_controllers/fan_check_controller.dart';
import 'package:fanby/fan_controllers/fan_profile_controller.dart';
import 'package:fanby/fan_screens/fan_main_screen/fan_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FanHelloScreen2 extends StatelessWidget {
  const FanHelloScreen2({super.key});

  int fandaysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    print((to.difference(from).inHours / 24));
    return (to.difference(from).inHours / 24).round();
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
      child: GetBuilder<FanProfileController>(builder: (controller) {
        return GetBuilder<FanCheckController>(builder: (checkController) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'SELF CHECK',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 22,
                                fontVariations: [FontVariation('wght', 700)],
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "You're just a step away from taking control of your breast health journey",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 14,
                                fontVariations: [FontVariation('wght', 400)],
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'There’s No Wrong Way to Perform a Self-Check',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 22,
                                fontVariations: [FontVariation('wght', 700)],
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Whether you prefer to do it in bed or in the shower, what matters is creating a routine that works for you. Regularly checking yourself helps you understand what’s “normal” for your body, so you’re more likely to notice if something changes. To get a complete picture of your “normal,” try doing your self-check both standing up and lying down",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 14,
                                fontVariations: [FontVariation('wght', 400)],
                                color: Colors.white,
                                letterSpacing: -0.5,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Remember, lumps aren’t the only sign of breast cancer, and not all lumps are cancerous. Other symptoms that need attention include swelling, redness, scaliness, indentations, changes in the nipple, bruising, or more prominent veins than usual. If you notice anything that doesn’t seem normal, it’s important to have it checked out",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 14,
                                fontVariations: [FontVariation('wght', 400)],
                                color: Colors.white,
                                letterSpacing: -0.5,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'But There’s an Ideal Time to Check Yourself',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 22,
                                fontVariations: [FontVariation('wght', 700)],
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "The optimal time to do a self-check is about a week after your period ends. Since our bodies go through constant changes throughout the hormonal cycle, checking at this time gives you a better sense of how your body feels at its most “normal.”",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 14,
                                fontVariations: [FontVariation('wght', 400)],
                                color: Colors.white,
                                letterSpacing: -0.5,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Embrace Your Body',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 22,
                                fontVariations: [FontVariation('wght', 700)],
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "We understand that many people have complex feelings about their bodies. We’re here to support you, wherever you are on your journey, and to help you build a positive, loving relationship with your physical health.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 14,
                                fontVariations: [FontVariation('wght', 400)],
                                color: Colors.white,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    if (checkController.lastCheck == null ||
                        (checkController.lastCheck != null &&
                            fandaysBetween(
                                    DateTime.now(),
                                    controller.fanPrem
                                        ? DateTime(
                                            checkController.lastCheck!.year,
                                            checkController.lastCheck!.month,
                                            checkController.lastCheck!.day + 1)
                                        : DateTime(
                                            checkController.lastCheck!.year,
                                            checkController.lastCheck!.month +
                                                1,
                                            checkController.lastCheck!.day)) <=
                                0.01))
                      IntrinsicWidth(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed('/fan_check_mirror', id: 0);
                          },
                          child: Container(
                            height: 45,
                            margin: EdgeInsets.only(bottom: 30),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              'GET STARTED',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 14,
                                fontVariations: [FontVariation('wght', 700)],
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    else
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: IntrinsicWidth(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 45,
                              margin: EdgeInsets.only(bottom: 30),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Builder(builder: (context) {
                                final nextDate = checkController.lastCheck ==
                                        null
                                    ? DateTime.now()
                                    : controller.fanPrem
                                        ? DateTime(
                                            checkController.lastCheck!.year,
                                            checkController.lastCheck!.month,
                                            checkController.lastCheck!.day + 1)
                                        : DateTime(
                                            checkController.lastCheck!.year,
                                            checkController.lastCheck!.month +
                                                1,
                                            checkController.lastCheck!.day);
                                return Text(
                                  'NEXT CHECK IN ${fandaysBetween(DateTime.now(), controller.fanPrem ? DateTime(checkController.lastCheck!.year, checkController.lastCheck!.month, checkController.lastCheck!.day + 1) : DateTime(checkController.lastCheck!.year, checkController.lastCheck!.month + 1, checkController.lastCheck!.day))} DAY(S)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Mont',
                                    fontSize: 14,
                                    fontVariations: [
                                      FontVariation('wght', 700)
                                    ],
                                    color: Colors.white,
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          );
        });
      }),
    );
  }
}
