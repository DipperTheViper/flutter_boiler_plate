import 'package:flutter/cupertino.dart';
import 'package:flutter_boiler_plate/utils/styles/colors/colors.dart';

abstract class AppDecoration {
  static BoxDecoration defaultDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: ColorsCategory.black,
  );
}
