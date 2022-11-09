import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  @override
  void onReady() {
    super.onReady();
    
  }

  void toogleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signIn() {}

  void signOut() {}

  void website() {}

  void email() {
    final Uri emailLaunchuri=Uri(scheme: 'mailto',path: 'asd@gmail.com');
    _launch(emailLaunchuri.toString());
  }

  Future<void> _launch(String url)async {
    if(!await launch(url)){
      throw 'could not launch $url';
    }
  }

}
