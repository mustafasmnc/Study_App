import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/auth/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User> user = Rxn();

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toogleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signIn() {
    Get.find<AuthController>().signInwithGoogle();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void website() {
    _launch('https://www.google.com');
  }

  void facebook() {
    _launch('https://www.facebook.com');
  }

  void email() {
    final Uri emailLaunchuri = Uri(scheme: 'mailto', path: 'asd@gmail.com');
    _launch(emailLaunchuri.toString());
  }

  Future<void> _launch(String url) async {
    if (!await launch(url)) {
      throw 'could not launch $url';
    }
  }
}
