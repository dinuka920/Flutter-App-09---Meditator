import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:meditator_app/models/function_data_model.dart';
import 'package:meditator_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';
import 'package:meditator_app/pages/function_page.dart';
import 'package:meditator_app/pages/main_screen.dart';
import 'package:meditator_app/pages/mindfull_exercise_details_page.dart';
import 'package:meditator_app/pages/mindfull_exercise_timer.dart';
import 'package:meditator_app/pages/sleep_Exercise_timer.dart';
import 'package:meditator_app/router/router_names.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: RouterName.mainPage,
        builder: (context, state) {
          return MainScreen();
        },
      ),
      GoRoute(
        path: "/mindfullExercise",
        name: RouterName.mindfullExercise,
        builder: (context, state) {
          final mindfulnessExerciseModelJson =
              state.uri.queryParameters["mindfulExercise"];
          final mindfulExerciseModel = MindfulnessExerciseModel.fromJson(
            jsonDecode(mindfulnessExerciseModelJson!),
          );
          return MindfullExerciseDetailsPage(
            mindfullExerciseModel: mindfulExerciseModel,
          );
        },
      ),
      GoRoute(
        path: "/functions",
        name: RouterName.functions,
        builder: (context, state) {
          final FunctionDataModel functionDataModel =
              state.extra as FunctionDataModel;
          return FunctionPage(functionDataModel: functionDataModel);
        },
      ),
      GoRoute(
        path: "/mindfullExerciseTimer",
        name: RouterName.mindfullExerciseTimer,
        builder: (context, state) {
          final mindfullExerciseModelJson =
              state.uri.queryParameters["mindfullExerciseTimer"];
          final mindfulnessExerciseModel = MindfulnessExerciseModel.fromJson(
            jsonDecode(mindfullExerciseModelJson!),
          );
          return MindfullExerciseTimer(
            mindfulnessExerciseModel: mindfulnessExerciseModel,
          );
        },
      ),
      GoRoute(
        path: "/sleepExerciseTimer",
        name: RouterName.sleepExerciseTimer,
        builder: (context, state) {
          final sleepExerciseTimerJson =
              state.uri.queryParameters["sleepExercise"];
          final SleepExerciseModel sleepExerciseModel =
              SleepExerciseModel.fromJson(
            jsonDecode(sleepExerciseTimerJson!),
          );
          return SleepExerciseTimer(
            sleepExerciseModel: sleepExerciseModel,
          );
        },
      )
    ],
  );
}
