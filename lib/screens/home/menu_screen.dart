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
            Positioned(top: 0,right: 0,
                child: BackButton(
              color: Colors.white,
              onPressed: () {
                controller.toogleDrawer();
              },
            ))
          ],
        )),
      ),
    );
  }
}
