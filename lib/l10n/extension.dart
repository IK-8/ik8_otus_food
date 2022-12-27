import 'package:flutter_gen/gen_l10n/app_localizations.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
export 'package:intl/intl.dart';

extension StringLocalizationEx on String {
  String setParam(dynamic value) => replaceFirst('\$param', '$value');
}

extension AppLocalizationEx on AppLocalizations {
  String hours(int value) {
    return Intl.plural(value,
        other: hourOther.setParam(value),
        one: hourOne.setParam(value),
        few: hourFew.setParam(value),
        locale: localeName);
  }

  String minutes(int value) {
    return Intl.plural(value,
        other: minuteOther.setParam(value),
        one: minuteOne.setParam(value),
        few: minuteFew.setParam(value),
        locale: localeName);
  }

  String seconds(int value) {
    return Intl.plural(value,
        other: secondOther.setParam(value),
        one: secondOne.setParam(value),
        few: secondFew.setParam(value),
        locale: localeName);
  }

  String hourMinuteSecondsDurationFormat(int allSeconds) {
    var seconds = allSeconds;
    var minute = seconds ~/ 60;
    seconds = seconds - minute * 60;

    var hour = minute ~/ 60;
    minute = minute - hour * 60;

    StringBuffer buffer = StringBuffer();
    if (hour != 0) {
      buffer.write('${hours(hour)} ');
    }
    if (minute != 0) {
      buffer.write('${minutes(minute)} ');
    }
    if (seconds != 0) {
      buffer.write('${this.seconds(seconds)} ');
    }
    return buffer.toString();
  }
}
