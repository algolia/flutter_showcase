import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';

extension FilterExt on Filter {
  String toLabel() {
    final filter = this;
    if (filter is FilterFacet) {
      return filter.value;
    } else if (filter is FilterTag) {
      return filter.value;
    } else if (filter is FilterNumeric) {
      return filter.toLabel();
    } else {
      throw UnsupportedError(runtimeType.toString());
    }
  }
}

extension FilterNumericExt on FilterNumeric {
  String toLabel() {
    final numericValue = value;
    if (numericValue is NumericRange) {
      return '${attribute.capitalize()}: ${numericValue.lowerBound}..${numericValue.upperBound}';
    } else if (numericValue is NumericComparison) {
      return '${attribute.capitalize()} ${numericValue.operator.operator} ${numericValue.number}';
    } else {
      throw UnsupportedError(numericValue.runtimeType.toString());
    }
  }
}

extension StringExtension on String {
  String capitalize() =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}
