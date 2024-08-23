import 'package:fanby/fan_controllers/fan_check_controller.dart';
import 'package:fanby/fan_controllers/fan_profile_controller.dart';
import 'package:get/get.dart';

class FanBinds extends Bindings {
  @override
  void dependencies() {
    Get.put(FanCheckController());
    Get.put(FanProfileController());
  }

}