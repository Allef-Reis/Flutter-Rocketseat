import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app-colors.dart';

class DividerVerticalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      color: AppColors.stroke,
      height: double.maxFinite,
    );
  }
}
