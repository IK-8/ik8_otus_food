import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

import '../../config/theme/main.dart';

const _end = primaryColor;
const _start = primaryDarkColor;
const _foreground = 'assets/decoration/splash_mask.png';
const _label = 'OTUS\nFOOD';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topRight,
                stops: [0, 0.8],
                colors: [_start, _end])),
        child: Center(
          child: WidgetMask(
              blendMode: BlendMode.modulate,
              childSaveLayer: true,
              mask: Image.asset(
                _foreground,
                fit: BoxFit.cover,
              ),
              child: const Text(
                _label,
                style: TextStyle(
                    fontSize: 95,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    height: 0.9),
              )),
        ),
      ),
    );
  }
}
