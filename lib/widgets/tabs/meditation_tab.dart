import 'package:flutter/material.dart';
import 'package:meditator_app/models/meditation_exercise_model.dart';
import 'package:meditator_app/providers/custom_data_provider.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/utils/text_styles.dart';
import 'package:provider/provider.dart';

class MeditationTab extends StatelessWidget {
  const MeditationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Consumer<CustomDataProvider>(
              builder: (context, meditationData, child) {
                final List<MeditationExerciseModel> meditations =
                    meditationData.getMeditations();
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: meditations.length,
                  itemBuilder: (context, index) {
                    MeditationExerciseModel meditation = meditations[index];
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
                              meditation.name,
                              style: AppTextStyles.subtitleStyle,
                            ),
                            IconButton(
                              onPressed: () {
                                meditationData.deleteMeditation(
                                    meditation, context);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: AppColors.primaryPurple,
                              ),
                            )
                          ],
                        ),
                        subtitle: Text(
                          meditation.description,
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
