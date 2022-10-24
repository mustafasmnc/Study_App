import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/app_icons.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/configs/themes/custom_text_styles.dart';
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
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(mobileScreenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      AppIcons.menuLeft,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Icon(
                            AppIcons.peace,
                          ),
                          Text(
                            'Hello Friend',
                            style:
                                detailText.copyWith(color: onSurfaceTextColor),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "What do you want to learn today?",
                      style: headerText,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ContentArea(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
