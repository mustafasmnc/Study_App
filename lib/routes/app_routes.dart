import 'package:get/get.dart';
import 'package:study_app/screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        
      ];
}
