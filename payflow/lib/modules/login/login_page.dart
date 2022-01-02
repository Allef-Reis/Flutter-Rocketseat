import 'package:flutter/material.dart';

import '../../shared/themes/app-colors.dart';
import '../../shared/themes/app-images.dart';
import '../../shared/themes/app-text-style.dart';
import '../../shared/widgets/social_login_button.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final controller = LoginController();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              color: AppColors.primary,
            ),
            Positioned(
                left: 0,
                right: 0,
                top: 40,
                child: Image.asset(
                  AppImages.person,
                  width: 208,
                  height: 300,
                )),
            Positioned(
              left: 0,
              right: 0,
              bottom: size.height * 0.18,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.logomini,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70.0, vertical: 40.0),
                    child: Text(
                      "Organize seus boletos em um so lugar!",
                      style: TextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SocialLoginButton(onTap: () {
                    controller.googleSignIn(context);
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
