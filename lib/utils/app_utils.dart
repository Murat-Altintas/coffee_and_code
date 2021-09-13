import 'dart:ui';

import 'package:coffee_and_code/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices =>
      {PointerDeviceKind.touch, PointerDeviceKind.mouse};
}

abstract class LocaleUtils {
  static late NumberFormat _priceFormat;
  static final _weightFormat = NumberFormat('#.#');

  static void initLocale() {
    Get.locale ??= AppLocales.supportedLocales.first;
    Intl.defaultLocale = Get.locale.toString();
    //// update formats.
    _priceFormat = NumberFormat.currency();
  }

  static String formatPrice(num price) {
    return _priceFormat.format(price);
  }

  static String getKgOrPounds(num kg) {
    num value = kg;
    String type = 'kg';
    if (isImperialSystem()) {
      value = MeasureUtils.toPounds(kg);
      type = 'lb';
    }
    return _weightFormat.format(value) + type;
  }

  static String getGramsOrOunzes(num grams) {
    num value = grams;
    String type = 'gr';
    if (isImperialSystem()) {
      value = MeasureUtils.toOzw(grams);
      type = 'oz';
    }
    return _weightFormat.format(value) + type;
  }

  static bool isImperialSystem() => Intl.defaultLocale == 'en';
}

abstract class MeasureUtils {
  static double toGrams(num ounces) => ounces / 0.0353;

  /// from grams to ounces
  static double toOzw(num grams) => grams * 0.0353;

  /// from kg to pounds
  static double toPounds(num kg) => kg * 2.20462;

  static double toOzl(num milliliters) => milliliters / 29.5735;

  /// milimeters to inches.
  static double mmToInch(num m) => m * 0.0393701;
}
