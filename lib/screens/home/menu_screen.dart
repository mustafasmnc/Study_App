import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/controllers/drawer/zoom_drawer_controller.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(color: customScaffoldColor(context)),
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
                  right: MediaQuery.of(context).size.width * 0.3),
              child: Column(
                children: [
                  Obx(
                    () => controller.user.value == null
                        ? SizedBox()
                        : Text(
                            controller.user.value!.displayName ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: onSurfaceTextColor,
                            ),
                          ),
                  ),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: _DrawerButton(
                      icon: Icons.email,
                      label: 'Email',
                      onTap: () => controller.email(),
                    ),
                  ),
                  const Spacer(flex: 4),
                  _DrawerButton(
                    icon: Icons.logout,
                    label: 'Log Out',
                    onTap: () => controller.signOut(),
                  ),
                ],
              ),
            )
          ],
        )),
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
