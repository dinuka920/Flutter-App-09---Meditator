import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meditator_app/models/mindfulness_exercise_model.dart';

class MindfullExerciseService {
  var mindfulnessBox = Hive.box("mindfulness_data");
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
}
