import 'package:flutter/material.dart';
import 'package:meditator_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_app/providers/custom_data_provider.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/utils/text_styles.dart';
import 'package:provider/provider.dart';

class MindfullExerciseTab extends StatelessWidget {
  const MindfullExerciseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Consumer<CustomDataProvider>(
              builder: (context, mindfullData, child) {
                final List<MindfulnessExerciseModel> mindfullExercises =
                    mindfullData.getMindfulExercises();
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: mindfullExercises.length,
                  itemBuilder: (context, index) {
                    MindfulnessExerciseModel mindfullExercise =
                        mindfullExercises[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryDarkBlue.withOpacity(0.1),
                      ),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              mindfullExercise.name,
                              style: AppTextStyles.subtitleStyle,
                            ),
                            IconButton(
                              onPressed: () {
                                mindfullData.deleteMindfullExercise(
                                    mindfullExercise, context);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: AppColors.primaryPurple,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          mindfullExercise.description,
                          style: AppTextStyles.bodyStyle.copyWith(
                            color: AppColors.primaryPurple.withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
