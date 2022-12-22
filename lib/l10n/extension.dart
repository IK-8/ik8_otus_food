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
// extension AppLocalizationEx on AppLocalizations {
//   String stringWithParamValue(int param) =>
//       stringWithParam.replaceFirst('\$number', param.toString());
//   static ExtensionField<Plurals>? _yearsPlurals;
//   Plurals get yearsPluralsCurrent {
//     return ExtensionField.fromCurrent(_yearsPlurals, runtimeType, (mark) {
//       return (_yearsPlurals = ExtensionField(
//           Plurals(yearsPlurals,
//               one: yearsPlurals1, two: yearsPlurals2, few: yearsPluralsFew),
//           mark));
//     }).field;
//   }
//
//   String years(int year) {
//     return yearsPluralsCurrent
//         .value(year)
//         .replaceFirst('\$number', year.toString());
//   }
//
//   String? ageText(int? minAge, int? maxAge) {
//     if (minAge != null || maxAge != null) {
//       if (minAge == maxAge) {
//         return years(minAge!);
//       } else if (minAge != null && maxAge != null) {
//         return '$minAge - $maxAge';
//       } else if (minAge != null) {
//         return 'от $minAge';
//       } else if (maxAge != null) {
//         return 'до $maxAge';
//       }
//     }
//     return null;
//   }
// }
//
// class ExtensionField<T> {
//   final T field;
//   final dynamic objMark;
//   ExtensionField(this.field, this.objMark);
//   equals(dynamic mark) => objMark == mark;
//   static ExtensionField<T> fromCurrent<T>(ExtensionField<T>? exist, mark,
//       ExtensionField<T> Function(dynamic mark) create) {
//     if (exist == null || !exist.equals(mark)) {
//       return create(mark);
//     }
//     return exist;
//   }
// }
