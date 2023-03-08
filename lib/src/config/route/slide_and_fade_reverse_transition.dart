import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class Sprung extends Curve {
  Sprung.custom({
    double damping = 20,
    double stiffness = 180,
    double mass = 1.0,
    double velocity = 0.0,
  }) : _sim = SpringSimulation(
          SpringDescription(
            damping: damping,
            mass: mass,
            stiffness: stiffness,
          ),
          0.0,
          1.0,
          velocity,
        );

  final SpringSimulation _sim;

  @override
  double transform(double t) => _sim.x(t) + t * (1 - _sim.x(1.0));
}

final _firstTween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
    .chain(CurveTween(
        curve: Sprung.custom(stiffness: 92.9, mass: 1, damping: 14)));
final _secondTween = Tween(begin: 0.0, end: 1.0).chain(
    CurveTween(curve: Sprung.custom(stiffness: 100, mass: 1, damping: 15)));

Route slideAndReverseFadeTransitionRoute(Widget child) {
  bool? toNext;
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return child;
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, child) {
      if (toNext == null || toNext!) {
        if (animation.isCompleted) {
          toNext = toNext == null;
        }
      }
      if (toNext == null || toNext!) {
        final offsetAnimation = animation.drive(_firstTween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      }
      final offsetAnimation = animation.drive(_secondTween);
      return FadeTransition(
        opacity: offsetAnimation,
        child: child,
      );
    },
    reverseTransitionDuration: const Duration(milliseconds: 800),
    transitionDuration: const Duration(milliseconds: 816),
  );
}
