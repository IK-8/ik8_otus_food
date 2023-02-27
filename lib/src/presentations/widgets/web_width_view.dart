import 'package:flutter/material.dart';

const kMaxWebWidth = 950.0;

class MaxWebWidthView extends StatelessWidget {
  final Widget child;

  const MaxWebWidthView({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < kMaxWebWidth) {
      return child;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: kMaxWebWidth,
            child: Material(
              elevation: 2,
              child: child,
            )),
      ],
    );
  }
}

class MaxWebWidthScrollbarView extends StatelessWidget {
  final Widget child;
  final ScrollController scrollController;

  const MaxWebWidthScrollbarView(
      {Key? key, required this.scrollController, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < kMaxWebWidth) {
      return child;
    }
    return Scrollbar(
      controller: scrollController,
      interactive: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
              width: kMaxWebWidth,
              child: Material(
                elevation: 2,
                child: child,
              )),
        ],
      ),
    );
  }
}
