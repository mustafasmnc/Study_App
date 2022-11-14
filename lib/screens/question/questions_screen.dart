import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/questions_controller.dart';
import 'package:study_app/firebase_ref/loading_status.dart';
import 'package:study_app/widgets/common/background_decoration.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({Key? key}) : super(key: key);
  static const String routeName = '/questionsscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
          child: Obx(() => Column(
                children: [
                  if (controller.loadingStatus.value == LoadingStatus.loading)
                    const Expanded(child: Center(child: CircularProgressIndicator())),
                  if (controller.loadingStatus.value == LoadingStatus.completed)
                    Expanded(
                        child: SingleChildScrollView(
                            child: Column(
                      children: [
                        Text(controller.currentQuestion.value!.question),
                      ],
                    ))),
                ],
              ))),
    );
  }
}
