import 'package:coffee_and_code/utils/app_utils.dart';

extension NumberExt on num {
  String get formatPrice => LocaleUtils.formatPrice(this);

  String get kgFormat => LocaleUtils.getKgOrPounds(this);

  String get grFormat => LocaleUtils.getGramsOrOunzes(this);
}
