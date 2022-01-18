import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app-colors.dart';
import 'package:payflow/shared/themes/app-text-style.dart';
import 'package:payflow/shared/widgets/divider/divider_vertical_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final String secundaryLabel;

  final VoidCallback primaryOnPressed;
  final VoidCallback secundaryOnPressed;

  final bool enablePrimaryColor;
  const SetLabelButtons({
    required this.primaryLabel,
    required this.secundaryLabel,
    required this.primaryOnPressed,
    required this.secundaryOnPressed,
    this.enablePrimaryColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: primaryLabel,
              onPressed: primaryOnPressed,
              style: enablePrimaryColor ? TextStyles.buttonBoldPrimary : null,
            ),
          ),
          DividerVerticalWidget(),
          Expanded(
            child: LabelButton(
              label: secundaryLabel,
              onPressed: secundaryOnPressed,
            ),
          ),
        ],
      ),
    );
  }
}
