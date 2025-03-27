import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditator_app/router/router_names.dart';
import 'package:meditator_app/utils/colors.dart';
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            GoRouter.of(context).pushNamed(RouterName.create);
          },
          child: Icon(
            Icons.add,
            color: AppColors.primaryPurple,
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
