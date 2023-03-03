import 'package:flutter/material.dart';

class AnimatedPulsationSizedBox extends ImplicitlyAnimatedWidget {
  final bool flag;
  final Size start;
  final Size half;
  final Size max;
  final Widget child;

  const AnimatedPulsationSizedBox({
  super.key,
  required this.flag,
  this.start = const Size.square(35),
  this.half = const Size.square(37),
  this.max = const Size.square(40),
  required this.child,
  super.duration = const Duration(seconds: 1),
  });

  @override
  AnimatedWidgetBaseState<AnimatedPulsationSizedBox> createState() =>
      _AnimatedPulsationSizedBoxState();
}

class _AnimatedPulsationSizedBoxState
    extends AnimatedWidgetBaseState<AnimatedPulsationSizedBox> {
  Tween<bool>? _flag;

  @override
  void initState() {
    super.initState();
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _flag = visitor(_flag, widget.flag,
            (dynamic value) => Tween<bool>(begin: value as bool)) as Tween<bool>?;
    // _color = visitor(
    //     _color,
    //     (widget.progress == 100
    //         ? AppThemeColors.purpleColor
    //         : AppThemeColors.amberColor),
    //         (dynamic value) => ColorTween(begin: value as Color)) as ColorTween?;
  }

  @override
  Widget build(BuildContext context) {
    final Animation<Size> animation = TweenSequence<Size>(
      <TweenSequenceItem<Size>>[
        TweenSequenceItem<Size>(
          tween: Tween<Size>(begin: widget.start, end: widget.max)
          // .chain(CurveTween(curve: Curves.ease))
          ,
          weight: 2.0,
        ),
        TweenSequenceItem<Size>(
          tween: Tween<Size>(begin: widget.max, end: widget.half)
          // .chain(CurveTween(curve: Curves.ease))
          ,
          weight: 1.0,
        ),
        TweenSequenceItem<Size>(
          tween: Tween<Size>(begin: widget.half, end: widget.max)
          // .chain(CurveTween(curve: Curves.ease))
          ,
          weight: 1.0,
        ),
        TweenSequenceItem<Size>(
          tween: Tween<Size>(begin: widget.half, end: widget.start)
          // .chain(CurveTween(curve: Curves.ease))
          ,
          weight: 1.0,
        ),
      ],
    ).animate(controller);
    // final Animation<double> animation = this.animation;
    final size = animation.value;
    return SizedBox.fromSize(
      size: size,
      child: widget.child,
    );
  }
}