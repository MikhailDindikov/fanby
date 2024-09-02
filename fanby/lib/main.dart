
import 'package:apphud/apphud.dart';
import 'package:fanby/fan_controllers/fan_binds.dart';
import 'package:fanby/fan_screens/fan_demo_screen/fan_demo_screen.dart';
import 'package:fanby/fan_screens/fan_hello_screen.dart/fan_hello_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Apphud.start(apiKey: 'app_Qrcbf3MjSg93z1i9dYPg5kDszvizwh');
  final fanBox = GetStorage();
  final showFanDemo = fanBox.read<bool?>('showFanDemo') ?? true;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp( FanbyApp(showFandemo: showFanDemo,));
}

class FanbyApp extends StatelessWidget {
  final bool showFandemo;
  const FanbyApp({super.key, required this.showFandemo});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fanby',
      initialBinding: FanBinds(),
      theme: ThemeData(
        useMaterial3: false,
      ),
      home:showFandemo ? FanDemoScreen(): const FanHelloScreen1(),
    );
  }
}
