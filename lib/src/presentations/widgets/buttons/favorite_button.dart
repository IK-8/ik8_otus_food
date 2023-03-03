import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class FavoriteButton extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool value;

  const FavoriteButton({Key? key, required this.onChanged, this.value = false})
      : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

const _checked = 'assets/animation/checked.png';
const _unchecked = 'assets/animation/unchecked.png';

class _FavoriteButtonState extends State<FavoriteButton> {
  SMIBool? _isChecked;
  bool isInitial = false;

  set isChecked(bool value) {
    if (!isInitial && _isChecked != null && !value) {
      setState(() {
        isInitial = true;
      });
    }
    _isChecked?.value = value;
  }

  @override
  void didUpdateWidget(covariant FavoriteButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      isChecked = widget.value;
    }
  }

  Artboard? _artboard;
  RiveFile? rive;


  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    Future(() async {
      final value = await rootBundle.load('assets/animation/animheartbeat.riv');
      rive = RiveFile.import(value);
      _artboard = rive!.mainArtboard.instance();
      final controller =
          StateMachineController.fromArtboard(_artboard!, 'States');
      _artboard!.addController(controller!);
      _isChecked = controller.findInput<bool>('IsChecked') as SMIBool;
      _isChecked!.value = widget.value;
      setState(() {});
      if (_isChecked!.value) {
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            setState(() {
              isInitial = true;
            });
          }
        });
      } else {
        setState(() {
          isInitial = true;
        });
      }
    });

    precacheImage(Image.asset(_checked).image, context);
    precacheImage(Image.asset(_unchecked).image, context);
  }

  @override
  Widget build(BuildContext context) {
    Widget placeholder() {
      return widget.value
          ? Image.asset(
              _checked,
              fit: BoxFit.contain,
            )
          : Image.asset(
              _unchecked,
              fit: BoxFit.contain,
            );
    }
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Container(
        height: 40,
        width: 40,
        color: Colors.transparent,
        child: Stack(
          children: [
            if (_artboard != null)
              Positioned.fill(
                child: Opacity(
                    opacity: isInitial ? 1 : 0.01,
                    child: Rive(artboard: _artboard!)),
              ),
            Positioned.fill(
              child:Opacity(
                  opacity: !isInitial ? 1 : 0,
                  child: placeholder()),
            ),
          ],
        ),
      ),
    );
  }
}
