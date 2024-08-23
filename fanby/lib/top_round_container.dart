import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class TopRoundContainer extends StatelessWidget {
  final Widget child;
  const TopRoundContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalTopBorderClipper(),
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 10),
        width: double.infinity,
        color: Colors.white,
        child: child,
      ),
    );
  }
}
