import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/app_icons.dart';
import 'package:study_app/configs/themes/custom_text_styles.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/screens/question/test_overview_screen.dart';
import 'package:study_app/widgets/app_circle_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.titleWidget,
    this.showActionIcon = false,
    this.onMenuActionTap,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: mobileScreenPadding, vertical: mobileScreenPadding),
      child: Stack(
        children: [
          Positioned.fill(
              child: titleWidget == null
                  ? Center(child: Text(title, style: appBarTS))
                  : Center(child: titleWidget)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading ??
                  Transform.translate(
                    offset: const Offset(-14, 0),
                    child: const BackButton(),
                  ),
              if (showActionIcon)
                Transform.translate(
                  offset: const Offset(00, 0),
                  child: InkWell(
                    child: const Icon(
                      AppIcons.menu,
                    ),
                    onTap: onMenuActionTap ??
                        () => Get.toNamed(TestOverviewScreen.routeName),
                  ),
                )
            ],
          )
        ],
      ),
    ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 80);
}
