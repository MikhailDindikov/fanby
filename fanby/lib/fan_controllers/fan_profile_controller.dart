import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FanProfileController extends GetxController {
  Uint8List? fanImg;
  bool fanPrem = false;

  String fanName = '';
  String fanBirth = '';

  Future<void> profInit() async {
    final fanBox = GetStorage();
    final rawProfImg = fanBox.read('profImg');
    if (rawProfImg != null) {
      fanImg = base64Decode(rawProfImg);
    }
    fanName = fanBox.read('profName') ?? '';
    fanBirth = fanBox.read('profBd') ?? '';
    fanPrem = fanBox.read('profPrem') ?? false;

    update();
  }

  Future<void> setProfImg(XFile newProfImg) async {
    fanImg = await newProfImg.readAsBytes();
    update();
    final fanBox = GetStorage();

    await fanBox.write('profImg', base64.encode(fanImg!.toList()));
  }

  Future<void> setProfInfo(String newprofName, String newprofBd) async {
    fanName = newprofName;
    fanBirth = newprofBd;
    final fanBox = GetStorage();
    fanBox.write('profName', fanName);
    fanBox.write('profBd', fanBirth);
    update();
  }

  Future<void> setProfPrem() async {
    fanPrem = true;
    final fanBox = GetStorage();
    fanBox.write('profPrem', true);
    update();
  }
}
