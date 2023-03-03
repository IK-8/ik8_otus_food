import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class FavoriteButton extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool value;

  const FavoriteButton({Key? key, required this.onChanged, this.value = false})
      : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  SMIBool? _isChecked;

  @override
  void didUpdateWidget(covariant FavoriteButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _isChecked?.value = widget.value;
    }
  }

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'States');
    artboard.addController(controller!);

    _isChecked = controller.findInput<bool>('IsChecked') as SMIBool;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: SizedBox(
        height: 40,
        width: 40,
        child: RiveAnimation.asset(
          'assets/animation/animheartbeat.riv',
          onInit: _onRiveInit,
        ),
      ),
    );
  }
}
