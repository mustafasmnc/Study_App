import 'package:get/get.dart';
import 'package:study_app/controllers/drawer/zoom_drawer_controller.dart';
import 'package:study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:study_app/controllers/question_paper/questions_controller.dart';
import 'package:study_app/screens/home/home_screen.dart';
import 'package:study_app/screens/introduction/introduction_screen.dart';
import 'package:study_app/screens/login/login_screen.dart';
import 'package:study_app/screens/question/answer_check_screen.dart';
import 'package:study_app/screens/question/questions_screen.dart';
import 'package:study_app/screens/question/result_screen.dart';
import 'package:study_app/screens/question/test_overview_screen.dart';
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
        GetPage(
            name: QuestionsScreen.routeName,
            page: () => QuestionsScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut<QuestionsController>(() => QuestionsController(),
                  fenix: true);
            })),
        GetPage(
          name: TestOverviewScreen.routeName,
          page: () => TestOverviewScreen(),
        ),
        GetPage(
            name: ResultScreen.routeName,
            page: () => ResultScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut<QuestionsController>(() => QuestionsController(),
                  fenix: true);
            })),
        GetPage(
          name: AnswerCheckScreen.routeName,
          page: () => AnswerCheckScreen(),
        ),
      ];
}
