import 'package:get/get.dart';
import 'package:study_app/controllers/drawer/zoom_drawer_controller.dart';
import 'package:study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:study_app/screens/home/home_screen.dart';
import 'package:study_app/screens/introduction/introduction_screen.dart';
import 'package:study_app/screens/login/login_screen.dart';
import 'package:study_app/screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: "/",
          page: () => SplashScreen(),
        ),
        GetPage(
          name: "/introduction",
          page: () => AppIntroductionScreen(),
        ),
        GetPage(
          name: "/home",
          page: () => HomeScreen(),
          binding: BindingsBuilder(() {
            Get.put(QuestionPaperController());
            Get.put(MyZoomDrawerController());
          }),
        ),
        GetPage(
          name: LoginScreen.routeName,
          page: () => LoginScreen(),
        ),
      ];
}
