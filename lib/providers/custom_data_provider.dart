import 'package:flutter/material.dart';
import 'package:meditator_app/models/meditation_exercise_model.dart';
import 'package:meditator_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';
import 'package:meditator_app/services/meditation_service.dart';
import 'package:meditator_app/services/mindfull_exercise_service.dart';
import 'package:meditator_app/services/sleep_exercise_service.dart';

class CustomDataProvider extends ChangeNotifier {
  final List<MeditationExerciseModel> _meditation = [];
  final List<SleepExerciseModel> _sleepExercises = [];
  final List<MindfulnessExerciseModel> _mindfullExercises = [];
  // getters
  List<MeditationExerciseModel> get meditation => _meditation;
  List<SleepExerciseModel> get sleepExercises => _sleepExercises;
  List<MindfulnessExerciseModel> get mindfullExercises => _mindfullExercises;

  // method to add a new meditation
  void addMeditation(MeditationExerciseModel meditation, BuildContext context) {
    try {
      _meditation.add(meditation);
      // meditation add to the local storage
      try {
        MeditationService().addMeditation(meditation, context);
      } catch (error) {
        print("provider local storage error : $error");
      }
      notifyListeners();
    } catch (error) {
      print("provider error : $error");
    }
  }

  // methode to add a new sleep exercise
  void addSleepExercise(
      SleepExerciseModel sleepExercise, BuildContext context) {
    try {
      _sleepExercises.add(sleepExercise);
      // sleep exercise add to the local storage
      try {
        SleepExerciseService().addSleepExercise(sleepExercise, context);
      } catch (error) {
        print("Error provider local storage : $error");
      }
      notifyListeners();
    } catch (error) {
      print("Error from provider : $error");
    }
  }

  // methode to add a new mindfull exercise
  void addNewMindfullExercise(
      MindfulnessExerciseModel mindfullExercise, BuildContext context) {
    try {
      _mindfullExercises.add(mindfullExercise);
      try {
        MindfullExerciseService()
            .addMindfulnessExercise(mindfullExercise, context);
      } catch (error) {
        print("Error of local storage in provider : $error");
      }
      notifyListeners();
    } catch (error) {
      print("Error of mindfull povider");
    }
  }
}
