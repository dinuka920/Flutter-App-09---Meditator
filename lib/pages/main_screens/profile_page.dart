import 'package:flutter/material.dart';
import 'package:meditator_app/models/meditation_exercise_model.dart';
import 'package:meditator_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';
import 'package:meditator_app/providers/custom_data_provider.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryPurple,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Here are your custom exercises",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<CustomDataProvider>(
                builder: (context, data, child) {
                  return ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _buildSectiontTitle("Meditations"),
                      _buildMeditationList(data.getMeditations()),
                      SizedBox(
                        height: 20,
                      ),
                      _buildSectiontTitle("Sleep Content"),
                      _buildSleepList(data.getSleepExercises()),
                      SizedBox(
                        height: 20,
                      ),
                      _buildSectiontTitle("Mindfull Exercises"),
                      _buildmindfullList(data.getMindfulExercises()),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectiontTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryBlack,
      ),
    );
  }

  Widget _buildContent({
    required title,
    required description,
    required duration,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        subtitle: Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        leading: Text(
          "$duration min",
          style: TextStyle(
            color: AppColors.primaryPurple,
          ),
        ),
      ),
    );
  }

  Widget _buildMeditationList(List<MeditationExerciseModel> data) {
    if (data.isEmpty) {
      return Text("No Meditation Created");
    }
    return Column(
      children: data.map((meditation) {
        return _buildContent(
          title: meditation.name,
          description: meditation.description,
          duration: meditation.duration,
        );
      }).toList(),
    );
  }

  Widget _buildmindfullList(List<MindfulnessExerciseModel> data) {
    if (data.isEmpty) {
      return Text("No Mindfull Exercise Created");
    }
    return Column(
      children: data.map((mindfull) {
        return _buildContent(
          title: mindfull.name,
          description: mindfull.description,
          duration: mindfull.duration,
        );
      }).toList(),
    );
  }

  Widget _buildSleepList(List<SleepExerciseModel> data) {
    if (data.isEmpty) {
      return Text("No Sleep Exercise Created");
    }
    return Column(
      children: data.map((sleep) {
        return _buildContent(
          title: sleep.name,
          description: sleep.description,
          duration: sleep.duration,
        );
      }).toList(),
    );
  }
}
