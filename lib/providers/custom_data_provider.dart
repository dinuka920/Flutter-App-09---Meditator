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

  // -- ADD --
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

  // -- GET --
  // method to get all the meditation
  List<MeditationExerciseModel> getMeditatrions() {
    try {
      final List<MeditationExerciseModel> allMeditation =
          MeditationService().getMeditation();
      return allMeditation;
    } catch (error) {
      print("get meditation provider error: $error");
      return [];
    }
  }

  // method to get all the mindfull exercises
  List<MindfulnessExerciseModel> getMindfulExercises() {
    try {
      final List<MindfulnessExerciseModel> allMindfullExercises =
          MindfullExerciseService().getMindfullExercises();
      return allMindfullExercises;
    } catch (error) {
      print("get mindfull provider error : $error");
      return [];
    }
  }

  // method to get all the sleep exercises
  List<SleepExerciseModel> getSleepExercises() {
    try {
      final List<SleepExerciseModel> allSleepExercises =
          SleepExerciseService().getSleepExercises();
      return allSleepExercises;
    } catch (error) {
      print("get mindfull provider error : $error");
      return [];
    }
  }

  // -- DELETE --
  // delete meditation exercise
  void deleteMeditation(
      MeditationExerciseModel meditationExercise, BuildContext context)  {
    try {
      _meditation.remove(meditationExercise);
      try {
        MeditationService().deleteMeditation(meditationExercise, context);
      } catch (error) {
        print("provider local storage Error: $error");
      }
      notifyListeners();
    } catch (error) {
      print("delete meditation provider error: $error");
    }
  }

  // delete mindfull exercise
  void deleteMindfullExercise(
      MindfulnessExerciseModel mindfullExercise, BuildContext context)  {
    try {
      _mindfullExercises.remove(mindfullExercise);
      try {
        MindfullExerciseService()
            .deleteMindfullExercise(mindfullExercise, context);
      } catch (error) {
        print("provider local storage Error: $error");
      }
      notifyListeners();
    } catch (error) {
      print("delete provider error: $error");
    }
  }

  // delete meditation
  void deleteSleepExercise(
      SleepExerciseModel sleepExercise, BuildContext context) {
    try {
      _sleepExercises.remove(sleepExercise);
      try {
        SleepExerciseService().deleteSleepExercise(sleepExercise, context);
      } catch (error) {
        print("provider local storage Error: $error");
      }
      notifyListeners();
    } catch (error) {
      print("delete meditation provider error: $error");
    }
  }
}
