import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meditator_app/models/mindfulness_exercise_model.dart';

class MindfullExerciseService {
  var mindfulnessBox = Hive.box("mindfulness_data");

  // method to add a new mindfull exercise to local storage
  Future<void> addMindfulnessExercise(
      MindfulnessExerciseModel mindfullExercise, BuildContext context) async {
    try {
      final allMindfullExercises = mindfulnessBox.get("mindfulness_data") ?? [];
      allMindfullExercises.add(mindfullExercise);
      await mindfulnessBox.put("mindfulness_data", allMindfullExercises);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("mindful Exercise added!"),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      print("Mindfull service error : $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("error adding Mindfull exercise!"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  // methode to get all the mindful exercises to the app
  List<MindfulnessExerciseModel> getMindfullExercises() {
    try {
      final allMindfullExercise = mindfulnessBox.get("mindfulness_data");
      if (allMindfullExercise != null && allMindfullExercise is List<dynamic>) {
        return allMindfullExercise.cast<MindfulnessExerciseModel>().toList();
      } else {
        return [];
      }
    } catch (error) {
      print("mindfull Add servise error: $error");
      return [];
    }
  }

  // method to delete a mindfull exercise
  Future<void> deleteMindfullExercise(
      MindfulnessExerciseModel mindfullExercise, BuildContext context) async {
    try {
      final allMindfullexercises = mindfulnessBox.get("mindfulness_data");
      allMindfullexercises.remove(mindfullExercise);
      await mindfulnessBox.put("mindfulness_data", allMindfullexercises);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("mindfull exercise deleted!"),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      print("meditation delete service error: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Faild to delete mindfull exercise!"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
