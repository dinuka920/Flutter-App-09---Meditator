import 'package:flutter/material.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';
import 'package:meditator_app/providers/custom_data_provider.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/utils/text_styles.dart';
import 'package:provider/provider.dart';

class SleepExerciseTab extends StatelessWidget {
  const SleepExerciseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Consumer<CustomDataProvider>(
              builder: (context, sleepData, child) {
                final List<SleepExerciseModel> sleepExercises =
                    sleepData.getSleepExercises();
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: sleepExercises.length,
                  itemBuilder: (context, index) {
                    SleepExerciseModel sleepExercise = sleepExercises[index];
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
                              sleepExercise.name,
                              style: AppTextStyles.subtitleStyle,
                            ),
                            IconButton(
                              onPressed: () {
                                sleepData.deleteSleepExercise(
                                    sleepExercise, context);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: AppColors.primaryPurple,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          sleepExercise.description,
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
