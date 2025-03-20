import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';

class SleepExerciseService {
  var sleepBox = Hive.box("sleep_data");

  // methode to add a sleep exercise
  Future<void> addSleepExercise(
      SleepExerciseModel sleepExercise, BuildContext context) async {
    try {
      final allSleepExercises = sleepBox.get("sleep_data") ?? [];

      await allSleepExercises.add(sleepExercise);

      await sleepBox.put("sleep_data", allSleepExercises);

    
      // show a snack bar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Sleep exercise Added!"),
          duration: Duration(seconds: 2),
        ),
      
      );
      
      
    } catch (error) {
      print("sleep service error : $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error Adding New Sleep Exercise!"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
