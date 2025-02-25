import 'package:flutter/material.dart';
import 'package:meditator_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/utils/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class MindfullExerciseDetailsPage extends StatelessWidget {
  final MindfulnessExerciseModel mindfullExerciseModel;
  const MindfullExerciseDetailsPage({
    super.key,
    required this.mindfullExerciseModel,
  });

  Future<void> _lauchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MindFull Exercise Details",
          style: TextStyle(
            fontSize: 29,
            color: AppColors.primaryPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(mindfullExerciseModel.name, style: AppTextStyles.titleStyle),
              SizedBox(
                height: 10,
              ),
              Text(
                mindfullExerciseModel.category,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                mindfullExerciseModel.description,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Instructions",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryBlack,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ...mindfullExerciseModel.instructions.map(
                (instruction) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.circle,
                        size: 8,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(instruction),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.timer,
                    color: AppColors.primaryGrey,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "${mindfullExerciseModel.duration} minutes",
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  await _lauchUrl(mindfullExerciseModel.instructionsUrl);
                },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll<Color>(AppColors.primaryGreen),
                ),
                child: Text(
                  "view Detailed Instructions",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlack,
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
