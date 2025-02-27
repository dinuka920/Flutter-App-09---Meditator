import 'package:flutter/material.dart';
import 'package:meditator_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/utils/text_styles.dart';

class MindfullExerciseTimer extends StatelessWidget {
  final MindfulnessExerciseModel mindfulnessExerciseModel;
  const MindfullExerciseTimer({
    super.key,
    required this.mindfulnessExerciseModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mindfulnessExerciseModel.name,
          // style: TextStyle(
          //   fontWeight: FontWeight.w600,
          // ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mindfulnessExerciseModel.category,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(mindfulnessExerciseModel.name,
                  style: AppTextStyles.titleStyle
                  // TextStyle(
                  //   fontSize: 22,
                  //   fontWeight: FontWeight.bold,
                  //   color: AppColors.primaryDarkBlue,
                  // ),
                  ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Duration: ${mindfulnessExerciseModel.duration} minutes",
                style: AppTextStyles.bodyStyle,
                // TextStyle(
                //   fontSize: 20,
                //   fontWeight: FontWeight.w500,
                //   color: AppColors.primaryBlack,
                // ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                mindfulnessExerciseModel.description,
                style: AppTextStyles.bodyStyle,
                // TextStyle(
                //   fontSize: 18,
                //   fontWeight: FontWeight.w500,
                //   color: AppColors.primaryBlack,
                // ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "instructions:",
                style: AppTextStyles.bodyStyle,
                // TextStyle(
                //   fontSize: 20,
                //   fontWeight: FontWeight.bold,
                //   color: AppColors.primaryDarkBlue,
                // ),
              ),
              SizedBox(
                height: 10,
              ),
              ...mindfulnessExerciseModel.instructions.map(
                (instruction) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: AppColors.primaryGreen.withOpacity(0.5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        instruction,
                        style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.w500,
                          // color: AppColors.primaryBlack,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
