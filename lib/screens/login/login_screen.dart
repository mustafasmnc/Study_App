import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/controllers/auth/auth_controller.dart';
import 'package:study_app/widgets/common/main_button.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/app_splash_logo.png",
              width: 200,
              height: 200,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempus fermentum massa eu dictum. Cras vitae interdum purus, luctus dignissim tellus. Proin blandit lectus sit amet dolor condimentum, eu commodo neque fringilla.',
                style: TextStyle(
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            MainButton(
              onTap: () {
                controller.signInwithGoogle();
              },
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      child: SvgPicture.asset('assets/icons/google.svg')),
                  Center(
                    child: Text(
                      'Sign in with Google',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
