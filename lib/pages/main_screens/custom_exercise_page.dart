import 'package:flutter/material.dart';
import 'package:meditator_app/widgets/tabs/meditation_tab.dart';
import 'package:meditator_app/widgets/tabs/mindful_exercise_tab.dart';
import 'package:meditator_app/widgets/tabs/sleep_exercise_tab.dart';

class CustomExercisePage extends StatelessWidget {
  const CustomExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Your Exercises"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Meditation",
              ),
              Tab(
                text: "Sleep Exercise",
              ),
              Tab(
                text: "Mindful Exercise",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MeditationTab(),
            SleepExerciseTab(),
            MindfullExerciseTab(),
          ],
        ),
      ),
    );
  }
}
