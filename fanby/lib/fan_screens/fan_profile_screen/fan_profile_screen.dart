import 'package:fanby/fan_controllers/fan_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class FanProfileScreen extends StatefulWidget {
  const FanProfileScreen({super.key});

  @override
  State<FanProfileScreen> createState() => _FanProfileScreenState();
}

class _FanProfileScreenState extends State<FanProfileScreen> {
  final profileController = Get.find<FanProfileController>();

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
          return SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
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
                  SizedBox(
                    height: 34,
                  ),
                  Text(
                    profileController.fanName,
                    style: TextStyle(
                      fontFamily: 'Mont',
                      fontSize: 16,
                      fontVariations: [FontVariation('wght', 800)],
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    profileController.fanBirth,
                    style: TextStyle(
                      fontFamily: 'Mont',
                      fontSize: 16,
                      fontVariations: [FontVariation('wght', 800)],
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  IntrinsicWidth(
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/fan_profile_edit', id: 1);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10.5, horizontal: 79),
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
                          'Edit',
                          style: TextStyle(
                            fontFamily: 'Mont',
                            fontSize: 20,
                            fontVariations: [FontVariation('wght', 700)],
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "WARNING!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Mont',
                      fontSize: 12,
                      fontVariations: [FontVariation('wght', 400)],
                      color: Color.fromRGBO(127, 127, 127, 1),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Text(
                      "The application is not a medical reference book. It just helps control your health",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Mont',
                        fontSize: 12,
                        fontVariations: [FontVariation('wght', 400)],
                        color: Color.fromRGBO(127, 127, 127, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Links to medical sources:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Mont',
                      fontSize: 18,
                      fontVariations: [FontVariation('wght', 600)],
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: GestureDetector(
                      onTap: () {
                        launchUrl(
                            Uri.parse(
                                'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4770726/'),
                            mode: LaunchMode.externalApplication);
                      },
                      child: Text(
                        "National Library of Medicine",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Mont',
                          fontSize: 16,
                          fontVariations: [FontVariation('wght', 500)],
                          color: Color.fromRGBO(127, 127, 127, 1),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: GestureDetector(
                      onTap: () {
                        launchUrl(
                            Uri.parse(
                                'https://err.ersjournals.com/content/28/152/190002'),
                            mode: LaunchMode.externalApplication);
                      },
                      child: Text(
                        "European Respiratory Review",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Mont',
                          fontSize: 16,
                          fontVariations: [FontVariation('wght', 500)],
                          color: Color.fromRGBO(127, 127, 127, 1),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
