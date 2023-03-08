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
  Tween<double>? _flag;

  @override
  void initState() {
    super.initState();
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _flag = visitor(_flag, widget.flag ? 0.0 : 1.0,
        (dynamic value) => Tween<double>(begin: value)) as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) {
    final Animation<Size> animation = TweenSequence<Size>(
      <TweenSequenceItem<Size>>[
        TweenSequenceItem<Size>(
          tween: Tween<Size>(begin: widget.start, end: widget.max),
          weight: 2.0,
        ),
        TweenSequenceItem<Size>(
          tween: Tween<Size>(begin: widget.max, end: widget.half),
          weight: 1.0,
        ),
        TweenSequenceItem<Size>(
          tween: Tween<Size>(begin: widget.half, end: widget.max),
          weight: 1.0,
        ),
        TweenSequenceItem<Size>(
          tween: Tween<Size>(begin: widget.half, end: widget.start),
          weight: 1.0,
        ),
      ],
    ).animate(controller);
    final size = animation.value;
    return SizedBox.fromSize(
      size: size,
      child: widget.child,
    );
  }
}
