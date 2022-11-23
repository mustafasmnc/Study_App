import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:study_app/configs/themes/app_dark_theme.dart';
import 'package:study_app/configs/themes/app_light_theme.dart';

class ThemeController extends GetxController {
  final _getStorage = GetStorage();
  final storageKey = "isDarkMode";
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  @override
  void onInit() {
    initializeThemeData();
    super.onInit();
  }

  initializeThemeData() {
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get darkTheme => _darkTheme;

  ThemeData get lightTheme => _lightTheme;

  ThemeData getThemeMode() {
    return isSavedDarkMode() ? darkTheme : lightTheme;
  }

  bool isSavedDarkMode() {
    return _getStorage.read(storageKey) ?? false;
  }

  void saveThemeMode(bool isDarkMode) {
    _getStorage.write(storageKey, isDarkMode);
  }

  void toggleDarkMode() {
    Get.changeTheme(isSavedDarkMode() ? lightTheme : darkTheme);
    saveThemeMode(!isSavedDarkMode());
    update();
  }
}
