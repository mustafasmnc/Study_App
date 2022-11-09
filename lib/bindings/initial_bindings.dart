import 'package:get/get.dart';
import 'package:study_app/controllers/auth/auth_controller.dart';
import 'package:study_app/controllers/theme/theme_controller.dart';
import 'package:study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:study_app/services/firebase_storage_service.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.put(QuestionPaperController());
    Get.put(FirebaseStorageService());
  }
}
