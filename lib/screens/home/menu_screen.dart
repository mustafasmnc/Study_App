import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/controllers/drawer/zoom_drawer_controller.dart';
import 'package:study_app/controllers/theme/theme_controller.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) => Container(
        //padding: UIParameters.mobileScreenPadding,
        width: double.maxFinite,
        decoration: BoxDecoration(color: customMenuColor(context)),
        child: Theme(
          data: ThemeData(
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(primary: onSurfaceTextColor))),
          child: SafeArea(
              child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.toogleDrawer();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3,
                  left: 15,
                  top: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'THEME',
                          style: TextStyle(
                            color: UIParameters.isDarkMode()
                                ? Theme.of(context).textTheme.bodyText1!.color
                                : Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color!
                                    .withOpacity(0.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                            onTap: () => themeController.toggleDarkMode(),
                            child: Icon(
                              UIParameters.isDarkMode()
                                  ? Icons.wb_sunny
                                  : Icons.nightlight_round,
                              size: 24,
                              color: UIParameters.isDarkMode()
                                  ? Theme.of(context).textTheme.bodyText1!.color
                                  : Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color!
                                      .withOpacity(0.8),
                            ))
                      ],
                    ),
                    Divider(
                      height: 25,
                      thickness: 0.5,
                      color: UIParameters.isDarkMode()
                          ? Theme.of(context).textTheme.bodyText1!.color
                          : Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.8),
                    ),
                    Obx(() => controller.user.value == null
                        ? SizedBox()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () =>
                                    print(controller.user.value!.photoURL),
                                child: SizedBox(
                                  width: 75,
                                  height: 75,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        controller.user.value!.photoURL!),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                controller.user.value!.displayName ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: onSurfaceTextColor,
                                ),
                              ),
                            ],
                          )),
                    const Spacer(flex: 1),
                    _DrawerButton(
                      icon: Icons.web,
                      label: 'Website',
                      onTap: () => controller.website(),
                    ),
                    _DrawerButton(
                      icon: Icons.facebook,
                      label: 'Facebook',
                      onTap: () => controller.facebook(),
                    ),
                    _DrawerButton(
                      icon: Icons.email,
                      label: 'Email',
                      onTap: () => controller.email(),
                    ),
                    const Spacer(flex: 4),
                    Obx(
                      () => controller.user.value == null
                          ? _DrawerButton(
                              icon: Icons.login,
                              label: 'Log In',
                              onTap: () => controller.signIn(),
                            )
                          : _DrawerButton(
                              icon: Icons.logout,
                              label: 'Log Out',
                              onTap: () => controller.signOut(),
                            ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  const _DrawerButton(
      {Key? key, required this.icon, required this.label, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onTap,
        icon: Icon(
          icon,
          size: 15,
        ),
        label: Text(label));
  }
}
