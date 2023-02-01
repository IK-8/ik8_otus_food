import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../injector.dart';
import 'splash_page.dart';

@Deprecated(
  'Используйте flutter_native_splash. '
  'Инициализируете зависимости в main.'
)
class InitializeApp extends StatefulWidget {
  const InitializeApp({Key? key}) : super(key: key);

  @override
  State<InitializeApp> createState() => _InitializeAppState();
}

class _InitializeAppState extends State<InitializeApp> {
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    initialized();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(
        Image.asset('assets/decoration/splash_mask.png').image, context);
  }

  initialized() async {
    await initializeDependencies();
    setState(() {
      isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      return const MaterialApp(home: SplashPage());
    }
    return const MyApp();
  }
}