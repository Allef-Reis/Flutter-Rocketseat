import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app-colors.dart';
import 'package:payflow/shared/themes/app-text-style.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BottomSheeetWidget extends StatelessWidget {
  final String primaryLabel;
  final String secundaryLabel;
  final String title;
  final String subtitle;
  final VoidCallback primaryOnPressed;
  final VoidCallback secundaryOnPressed;

  const BottomSheeetWidget({
    required this.primaryLabel,
    required this.secundaryLabel,
    required this.primaryOnPressed,
    required this.secundaryOnPressed,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      left: true,
      bottom: true,
      right: true,
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Text.rich(
                    TextSpan(
                        text: title,
                        style: TextStyles.buttonBoldHeading,
                        children: [
                          TextSpan(
                            text: "\n$subtitle",
                            style: TextStyles.buttonHeading,
                          )
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 1,
                  color: AppColors.stroke,
                ),
                SetLabelButtons(
                  enablePrimaryColor: true,
                  primaryLabel: primaryLabel,
                  secundaryLabel: secundaryLabel,
                  primaryOnPressed: primaryOnPressed,
                  secundaryOnPressed: secundaryOnPressed,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
