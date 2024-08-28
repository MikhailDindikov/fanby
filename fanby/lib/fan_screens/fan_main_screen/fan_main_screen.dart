import 'package:fanby/fan_check_navigator.dart';
import 'package:fanby/fan_controllers/fan_check_controller.dart';
import 'package:fanby/fan_controllers/fan_profile_controller.dart';
import 'package:fanby/fan_screens/fan_calendar_screen/fan_calendar_screen.dart';
import 'package:fanby/fan_screens/fan_settings_screen/fan_settings_screen.dart';
import 'package:fanby/fan_some/fan_profile_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FanMainScreen extends StatefulWidget {
  const FanMainScreen({super.key});

  @override
  State<FanMainScreen> createState() => _FanMainScreenState();
}

class _FanMainScreenState extends State<FanMainScreen> {
  final RxInt fanPage = 0.obs;
  final fanController = Get.find<FanCheckController>();
  final fanProfile = Get.find<FanProfileController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fanProfile.profInit();
      fanController.getNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 28)
            .copyWith(bottom: MediaQuery.of(context).padding.bottom + 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(62.5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 12.6),
              color: Color.fromRGBO(0, 0, 0, 0.14),
              blurRadius: 50.75,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                fanPage.value = 0;
              },
              child: Container(
                height: 24,
                width: 24,
                alignment: Alignment.center,
                child: Obx(() => SvgPicture.asset(
                      fanPage.value == 0
                          ? 'fan_assets/icons/anket_sel.svg'
                          : 'fan_assets/icons/anket.svg',
                    )),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                fanPage.value = 1;
              },
              child: Container(
                height: 24,
                width: 24,
                alignment: Alignment.center,
                child: Obx(() => SvgPicture.asset(
                      fanPage.value == 1
                          ? 'fan_assets/icons/calendar_sel.svg'
                          : 'fan_assets/icons/calendar.svg',
                    )),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                fanPage.value = 2;
              },
              child: Container(
                height: 24,
                width: 24,
                alignment: Alignment.center,
                child: Obx(() => SvgPicture.asset(
                      fanPage.value == 2
                          ? 'fan_assets/icons/profile_sel.svg'
                          : 'fan_assets/icons/profile.svg',
                    )),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                fanPage.value = 3;
              },
              child: Container(
                height: 24,
                width: 24,
                alignment: Alignment.center,
                child: Obx(() => SvgPicture.asset(
                      fanPage.value == 3
                          ? 'fan_assets/icons/settings_sel.svg'
                          : 'fan_assets/icons/settings.svg',
                    )),
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: fanPage.value,
          children: [
            FanCheckNavigator(),
            FanCalendarScreen(),
            //FanPremScreen(),
            FanProfileNavigator(),
            FanSettingsScreen(),
          ],
        ),
      ),
    );
  }
}
