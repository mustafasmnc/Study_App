import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/custom_text_styles.dart';
import 'package:study_app/controllers/question_paper/questions_controller.dart';
import 'package:study_app/screens/question/result_screen.dart';
import 'package:study_app/widgets/common/background_decoration.dart';
import 'package:study_app/widgets/common/custom_appbar.dart';
import 'package:study_app/widgets/content_area.dart';
import 'package:study_app/widgets/questions/answer_card.dart';

class AnswerCheckScreen extends GetView<QuestionsController> {
  const AnswerCheckScreen({Key? key}) : super(key: key);
  static const String routeName = '/answercheckscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titleWidget: Obx(() => Text(
              'Question: ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}',
              style: appBarTS,
            )),
        showActionIcon: true,
        onMenuActionTap: () {
          Get.toNamed(ResultScreen.routeName);
        },
      ),
      body: BackgroundDecoration(
        child: Obx(
          (() => Column(
                children: [
                  Expanded(
                    child: ContentArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Text(controller.currentQuestion.value!.question),
                            GetBuilder<QuestionsController>(
                                id: 'answer_review_list',
                                builder: (_) {
                                  return ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (_, index) {
                                      final answer = controller.currentQuestion
                                          .value!.answers[index];
                                      final selectedAnswer = controller
                                          .currentQuestion
                                          .value!
                                          .selectedAnswer;
                                      final correctAnswer = controller
                                          .currentQuestion.value!.correctAnswer;
                                      final String answerText =
                                          '${answer.identifier}-) ${answer.answer}';

                                      if (correctAnswer == selectedAnswer &&
                                          answer.identifier == selectedAnswer) {
                                        return CorrectAnswer(
                                            answer: answerText);
                                      } else if (correctAnswer ==
                                          answer.identifier) {
                                        //correct answer
                                        return CorrectAnswer(
                                            answer: answerText);
                                      } else if (selectedAnswer == null) {
                                        //not selected answer
                                        return NotAnswered(answer: answerText);
                                      } else if (correctAnswer !=
                                              selectedAnswer &&
                                          answer.identifier == selectedAnswer) {
                                        //wrong answer
                                        return WrongAnswer(answer: answerText);
                                      }

                                      return AnswerCard(
                                        answer: answerText,
                                        onTap: () {},
                                        isSelected: false,
                                      );
                                    },
                                    separatorBuilder: (_, index) {
                                      return const SizedBox(height: 10);
                                    },
                                    itemCount: controller
                                        .currentQuestion.value!.answers.length,
                                  );
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
