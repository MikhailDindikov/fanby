import 'package:fanby/fan_controllers/fan_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FanProfileEditScreen extends StatefulWidget {
  const FanProfileEditScreen({super.key});

  @override
  State<FanProfileEditScreen> createState() => _FanProfileEditScreenState();
}

class _FanProfileEditScreenState extends State<FanProfileEditScreen> {
  final profileController = Get.find<FanProfileController>();
  final fanName = TextEditingController();
  final fanBirth = TextEditingController();

  @override
  void initState() {
    fanName.text = profileController.fanName;
    fanBirth.text = profileController.fanBirth;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Assistance',
          style: TextStyle(
            fontFamily: 'Mont',
            fontSize: 18,
            fontVariations: [FontVariation('wght', 800)],
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<FanProfileController>(builder: (_) {
          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      //final status = await Permission.photos.request();
                      final _imagePicker = ImagePicker();
                      XFile? singleMedia = await _imagePicker.pickImage(
                          source: ImageSource.gallery);
                      if (singleMedia != null) {
                        await profileController.setProfImg(singleMedia);
                      }
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 151,
                          width: 151,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: profileController.fanImg == null
                              ? Image.asset(
                                  'fan_assets/images/avatar.png',
                                  fit: BoxFit.cover,
                                )
                              : Image.memory(
                                  profileController.fanImg!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Positioned(
                          bottom: -12,
                          right: -12,
                          child: Image.asset(
                            'fan_assets/images/edit.png',
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  TextFormField(
                    controller: fanName,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      errorBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      disabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: fanBirth,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      errorBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      disabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  IntrinsicWidth(
                    child: GestureDetector(
                      onTap: () async {
                        await profileController.setProfInfo(
                            fanName.text, fanBirth.text);
                        Get.back(id: 1);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.5, horizontal: 79),
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
                          'Save',
                          style: TextStyle(
                            fontFamily: 'Mont',
                            fontSize: 20,
                            fontVariations: [FontVariation('wght', 700)],
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
