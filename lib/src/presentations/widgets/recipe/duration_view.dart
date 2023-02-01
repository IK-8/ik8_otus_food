import 'package:flutter/material.dart';
import 'package:ik8_otus_food/l10n/extension.dart';

import '../../../config/theme/main.dart';

class DurationView extends StatelessWidget {
  final int seconds;

  const DurationView(this.seconds, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: [
          const Icon(
            Icons.schedule,
            size: 18,
          ),
          const SizedBox(width: 10),
          Text(
              AppLocalizations.of(context)!
                  .hourMinuteSecondsDurationFormat(seconds),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
        ],
      );
  }
}
