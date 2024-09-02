import 'package:apphud/apphud.dart';
import 'package:fanby/fan_controllers/fan_profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FanPremScreen extends StatefulWidget {
  const FanPremScreen({super.key});

  @override
  State<FanPremScreen> createState() => _FanPremScreenState();
}

class _FanPremScreenState extends State<FanPremScreen> {
  final profileController = Get.find<FanProfileController>();
  final RxBool fanBuy = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('fan_assets/images/prem_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: GetBuilder<FanProfileController>(builder: (_) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Premium',
                          style: TextStyle(
                            fontFamily: 'Mont',
                            fontSize: 18,
                            fontVariations: [FontVariation('wght', 700)],
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
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
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 4),
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  blurRadius: 4),
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'fan_assets/images/active.png',
                                  height: 30,
                                  width: 30,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    'Unlock unlimited breast checks',
                                    style: TextStyle(
                                      fontFamily: 'Mont',
                                      fontSize: 14,
                                      fontVariations: [
                                        FontVariation('wght', 700)
                                      ],
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        profileController.fanPrem
                            ? Container(
                                padding: EdgeInsets.all(4),
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
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 4),
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        blurRadius: 4),
                                  ],
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'fan_assets/images/active.png',
                                        height: 30,
                                        width: 30,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Premium Activated',
                                        style: TextStyle(
                                          fontFamily: 'Mont',
                                          fontSize: 14,
                                          fontVariations: [
                                            FontVariation('wght', 700)
                                          ],
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () async {
                                  if (!fanBuy.value) {
                                    fanBuy.value = true;
                                    final fanwwwwwwa = await Apphud.paywalls();
                                    var jgjkfkj = fanwwwwwwa
                                        ?.paywalls.first.products!.first;
                                    print(fanwwwwwwa?.paywalls.first.products!);
                                    final fanananafna = await Apphud.purchase(
                                      product: jgjkfkj,
                                    );
                                    if (fanananafna.error == null) {
                                      await profileController.setProfPrem();
                                      Get.showSnackbar(GetSnackBar(
                                        duration: Duration(milliseconds: 1500),
                                        messageText: Text(
                                          'Premium activated',
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
                                    } else {
                                      Get.showSnackbar(GetSnackBar(
                                        duration: Duration(milliseconds: 1500),
                                        messageText: Text(
                                          'Some error happens',
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
                                    }

                                    fanBuy.value = false;
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 15.5),
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
                                  child: Obx(
                                    () => fanBuy.value
                                        ? CupertinoActivityIndicator()
                                        : Text(
                                            'Buy for 0.99\$',
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
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}