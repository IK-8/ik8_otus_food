extension DoubleEx on double {
  String get fractionFormat {
    String countFormat = toString();
    var ceilCount = floor();
    var fraction = this - ceilCount;
    if (fraction != 0) {
      var fractionFormat = fractionFormatMap[fraction];
      if (fractionFormat != null) {
        if (ceilCount != 0) {
          countFormat = '$ceilCount $fractionFormat';
        } else {
          countFormat = fractionFormat;
        }
      }
    } else {
      countFormat = ceilCount.toString();
    }
    return countFormat;
  }

  bool get isFractional {
    var ceilCount = floor();
    return this - ceilCount != 0;
  }
}

final Map<double, String> fractionFormatMap = {
  0.5: '¹⁄₂',
  0.3: '¹⁄₃',
  0.25: '¹⁄₄',
};
