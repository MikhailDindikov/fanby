import 'package:carousel_slider/carousel_slider.dart';
import 'package:fanby/fan_controllers/fan_profile_controller.dart';
import 'package:fanby/fan_screens/fan_hello_screen.dart/fan_hello_screen_1.dart';
import 'package:fanby/fan_screens/fan_main_screen/fan_main_screen.dart';
import 'package:fanby/top_round_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class FanDemoScreen extends StatefulWidget {
  const FanDemoScreen({super.key});

  @override
  State<FanDemoScreen> createState() => _FanDemoScreenState();
}

class _FanDemoScreenState extends State<FanDemoScreen> {
  final fanCarousel = CarouselController();
  final fanName = TextEditingController();
  final fanBirth = TextEditingController();
  final fanPageCont = PageController();
  RxInt fanPage = 0.obs;
  RxString fanVisName = ''.obs;
  final profileController = Get.find<FanProfileController>();
  final fanBox = GetStorage();
  Rx<DateTime> dateBith = DateTime.now().obs;

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
                  alignment: Alignment.topCenter,
                  child: Obx(
                    () => AnimatedOpacity(
                      opacity: fanPage.value == 3 ? 1 : 0,
                      duration: Duration(milliseconds: 300),
                      child: Image.asset(
                        'fan_assets/images/hello4.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Obx(
                    () => AnimatedOpacity(
                      opacity: fanPage.value == 2 ? 1 : 0,
                      duration: Duration(milliseconds: 300),
                      child: Image.asset(
                        'fan_assets/images/photos.png',
                        height: 300,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Obx(
                      () => Opacity(
                        opacity: fanPage.value >= 2 ? 0 : 1,
                        child: IgnorePointer(
                          child: CarouselSlider.builder(
                            carouselController: fanCarousel,
                            options: CarouselOptions(
                              enlargeFactor: 0.5,
                              viewportFraction: 0.45,
                              enlargeCenterPage: true,
                              disableCenter: true,
                              onPageChanged: (index, reason) {},
                            ),
                            itemCount: 3,
                            itemBuilder: (context, index, realIndex) =>
                                Image.asset(
                              'fan_assets/images/hello${index + 1}.png',
                              height: 280,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
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
                        Obx(
                          () => AnimatedContainer(
                            duration: Duration(
                              milliseconds: 300,
                            ),
                            height: 5,
                            width: fanPage.value == 2 ? 31 : 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.5),
                              color: fanPage.value == 2
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
                            width: fanPage.value == 3 ? 31 : 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.5),
                              color: fanPage.value == 3
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Expanded(
                      child: TopRoundContainer(
                        child: Column(
                          children: [
                            Expanded(
                              child: PageView(
                                controller: fanPageCont,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Welcome!',
                                          style: TextStyle(
                                            fontFamily: 'Mont',
                                            fontSize: 36,
                                            fontVariations: [
                                              FontVariation('wght', 800)
                                            ],
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 45,
                                        ),
                                        TextFormField(
                                          controller: fanName,
                                          decoration: InputDecoration(
                                            hintText:
                                                "Enter your assistance's name",
                                            hintStyle: TextStyle(
                                              fontFamily: 'Mont',
                                              fontSize: 20,
                                              fontVariations: [
                                                FontVariation('wght', 400)
                                              ],
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                            ),
                                            border: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.black)),
                                            errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.black)),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.black)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.black)),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: Colors.black)),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: Colors.black)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 45,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Congratulations!',
                                          style: TextStyle(
                                            fontFamily: 'Mont',
                                            fontSize: 18,
                                            fontVariations: [
                                              FontVariation('wght', 800)
                                            ],
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 23,
                                        ),
                                        Text(
                                          "You're just a step away from taking control of your breast health journey",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Mont',
                                            fontSize: 12,
                                            fontVariations: [
                                              FontVariation('wght', 400)
                                            ],
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "We're here as your supportive partner, ready to guide you every step of the way",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Mont',
                                            fontSize: 12,
                                            fontVariations: [
                                              FontVariation('wght', 400)
                                            ],
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Our mission is to equip you with the tools to advocate for your own health",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Mont',
                                            fontSize: 12,
                                            fontVariations: [
                                              FontVariation('wght', 400)
                                            ],
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Remember, knowledge is empowering, and early detection is crucial",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Mont',
                                            fontSize: 12,
                                            fontVariations: [
                                              FontVariation('wght', 400)
                                            ],
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Set your assistance's photo",
                                          style: TextStyle(
                                            fontFamily: 'Mont',
                                            fontSize: 18,
                                            fontVariations: [
                                              FontVariation('wght', 800)
                                            ],
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () async {
                                            //final status = await Permission.photos.request();
                                            final _imagePicker = ImagePicker();
                                            XFile? singleMedia =
                                                await _imagePicker.pickImage(
                                                    source: ImageSource.camera);
                                            if (singleMedia != null) {
                                              await profileController
                                                  .setProfImg(singleMedia);

                                              fanCarousel.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.linear);
                                              fanPageCont.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.linear);
                                              fanPage.value++;
                                            }
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'fan_assets/images/camera.png',
                                                height: 45,
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Camera",
                                                  style: TextStyle(
                                                    fontFamily: 'Mont',
                                                    fontSize: 12,
                                                    fontVariations: [
                                                      FontVariation('wght', 400)
                                                    ],
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () async {
                                            //final status = await Permission.photos.request();
                                            final _imagePicker = ImagePicker();
                                            XFile? singleMedia =
                                                await _imagePicker.pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            if (singleMedia != null) {
                                              await profileController
                                                  .setProfImg(singleMedia);

                                              fanCarousel.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.linear);
                                              fanPageCont.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.linear);
                                              fanPage.value++;
                                            }
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'fan_assets/images/gallery.png',
                                                height: 45,
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Gallery",
                                                  style: TextStyle(
                                                    fontFamily: 'Mont',
                                                    fontSize: 12,
                                                    fontVariations: [
                                                      FontVariation('wght', 400)
                                                    ],
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'This app will assist you in:',
                                          style: TextStyle(
                                            fontFamily: 'Mont',
                                            fontSize: 18,
                                            fontVariations: [
                                              FontVariation('wght', 800)
                                            ],
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'fan_assets/images/active.png',
                                              height: 30,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "Scheduling and setting reminders for your monthly self-exam",
                                                style: TextStyle(
                                                  fontFamily: 'Mont',
                                                  fontSize: 12,
                                                  fontVariations: [
                                                    FontVariation('wght', 400)
                                                  ],
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 17,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'fan_assets/images/active.png',
                                              height: 30,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "Providing step-by-step guidance for your self-check every month",
                                                style: TextStyle(
                                                  fontFamily: 'Mont',
                                                  fontSize: 12,
                                                  fontVariations: [
                                                    FontVariation('wght', 400)
                                                  ],
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            IntrinsicWidth(
                              child: GestureDetector(
                                onTap: () {
                                  if (fanPage.value == 0) {
                                    if (fanName.text.isNotEmpty) {
                                      fanVisName.value = fanName.text;
                                      profileController.fanName = fanName.text;
                                    } else {
                                      Get.showSnackbar(GetSnackBar(
                                        duration: Duration(milliseconds: 1500),
                                        messageText: Text(
                                          'Fill text field!',
                                          style: TextStyle(
                                            fontFamily: 'Mont',
                                            fontSize: 18,
                                            fontVariations: [
                                              FontVariation('wght', 800)
                                            ],
                                            color: Colors.black,
                                          ),
                                        ),
                                        backgroundColor: Colors.white,
                                      ));
                                      return;
                                    }
                                  }
                                  if (fanPage.value == 111) {
                                    profileController.fanBirth =
                                        '${dateBith.value.day}.${dateBith.value.month}.${dateBith.value.year}';
                                  }
                                  if (fanPage.value == 3) {
                                    fanBox.write('showFanDemo', false);

                                    profileController.setProfInfo(
                                        profileController.fanName,
                                        profileController.fanBirth);
                                    Get.offAll(() => FanHelloScreen1());
                                  }
                                  if (fanPage.value != 3) {
                                    fanCarousel.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.linear);
                                    fanPageCont.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.linear);
                                    fanPage.value++;
                                  }
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
