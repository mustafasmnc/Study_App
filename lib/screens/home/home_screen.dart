import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/controllers/question_paper/quesion_paper_controller.dart';
import 'package:study_app/screens/home/question_card.dart';
import 'package:study_app/widgets/content_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: ContentArea(
        addPadding: false,
        child: Obx(
          () => ListView.separated(
            padding: UIParameters.mobileScreenPadding,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
            itemCount: _questionPaperController.allPapers.length,
            itemBuilder: (BuildContext context, int index) {
              return QuestionCard(
                model: _questionPaperController.allPapers[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
