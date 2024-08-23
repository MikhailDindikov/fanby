import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FanSystemScreen extends StatefulWidget {
  final String fancontrollerWT;
  const FanSystemScreen({super.key, required this.fancontrollerWT});

  @override
  State<FanSystemScreen> createState() => _FanSystemScreenState();
}

class _FanSystemScreenState extends State<FanSystemScreen> {
  late WebViewController tecontrollerW;

  @override
  void initState() {
    String fanllllW = '';
    if (widget.fancontrollerWT == 'Privacy Policy') {
      fanllllW =
          'https://docs.google.com/document/d/1qLW_bGKMGZlJ-5Ohofw8TnwXxxSOSqybdgO3zZrsJI4/edit?usp=sharing';
    } else if (widget.fancontrollerWT == 'Terms of Use') {
      fanllllW =
          'https://docs.google.com/document/d/1mBPBrFnADGEyZrfaClCAol-QDse7lIRZUgei-v4fR9E/edit?usp=sharing';
    } else {
      fanllllW = 'https://sites.google.com/view/bas-partners-ltd/support-form';
    }

    tecontrollerW = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(fanllllW));
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
        leading: GestureDetector(
          onTap: Get.back,
          child: Container(
            height: 20,
            width: 20,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 16),
            child: Image.asset('fan_assets/images/back.png'),
          ),
        ),
        title: Text(
          widget.fancontrollerWT,
          style: TextStyle(
            fontFamily: 'Mont',
            fontSize: 18,
            fontVariations: [FontVariation('wght', 800)],
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebViewWidget(
              controller: tecontrollerW,
            ),
          )
        ],
      ),
    );
  }
}
