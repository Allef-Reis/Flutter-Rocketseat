import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app-colors.dart';
import 'package:payflow/shared/themes/app-images.dart';
import 'package:payflow/shared/themes/app-text-style.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;

  const SocialLoginButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        height: 56,
        decoration: BoxDecoration(
            color: AppColors.shape,
            borderRadius: BorderRadius.circular(5),
            border: Border.fromBorderSide(
              BorderSide(color: AppColors.stroke),
            )),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.google),
                  SizedBox(
                    width: 16,
                  ),
                  Container(width: 1, height: 56, color: AppColors.stroke)
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  "Entrar com Google",
                  style: TextStyles.buttonGray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
