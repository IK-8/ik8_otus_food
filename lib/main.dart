import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ik8_otus_food/src/config/theme/main.dart';
import 'package:ik8_otus_food/src/injector.dart';
import 'package:ik8_otus_food/src/presentations/pages/splash.dart';

import 'l10n/extension.dart';
import 'src/presentations/pages/recipe/list.dart';

//
// class A {
//   int key;
//
//   A(this.key);
// }
//
// class B extends Equatable {
//   int key;
//
//   @override
//   List<Object?> get props => [key];
//
//   B(this.key);
// }

void main() {
  // print([1, 2, 3] == [1, 2, 3]);
  // print(A(1) == A(1));
  // print(B(1) == B(1));
  // print([B(1)] == [B(1)]);
  // print(EquatableList([B(1)]) == EquatableList([B(1)]));
  runApp(const InitializeApp());
}

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTUS FOOD',
      theme: theme,
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: const RecipeListPage(),
    );
  }
}
