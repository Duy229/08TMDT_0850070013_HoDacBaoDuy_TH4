import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:th4_bai4/controllers/question_controller.dart';
import 'package:th4_bai4/models/Questions.dart';

import '../../../constants.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              question.question,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: kBlackColor),
            ),
            const SizedBox(height: kDefaultPadding / 2),
            ...List.generate(
              question.options.length,
                  (index) => SizedBox(
                height: 50, // Adjust the height as needed
                child: Option(
                  index: index,
                  text: question.options[index],
                  press: () => controller.checkAns(question, index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
