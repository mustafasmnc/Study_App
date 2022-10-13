import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/quesion_paper_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                child: SizedBox(
                    height: 200,
                    width: 200,
                    child: FadeInImage(
                      placeholder:
                          AssetImage("assets/images/app_splash_logo.png"),
                      image: NetworkImage(
                          _questionPaperController.allPaperImages[index]),
                    )),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
            itemCount: _questionPaperController.allPaperImages.length),
      ),
    );
  }
}
