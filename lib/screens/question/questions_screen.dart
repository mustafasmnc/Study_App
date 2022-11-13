import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/questions_controller.dart';
import 'package:study_app/widgets/common/background_decoration.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({Key? key}) : super(key: key);
  static const String routeName = '/questionsscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: BackgroundDecoration(
        child: Center(child: Text('hii')),
      ),
    );
  }
}
  