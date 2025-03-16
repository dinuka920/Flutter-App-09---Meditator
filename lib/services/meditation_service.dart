import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meditator_app/models/meditation_exercise_model.dart';

class MeditationService {
  var meditationBox = Hive.box("meditation_data");

  // methode to add a new meditation
  Future<void> addMeditation(
      MeditationExerciseModel meditation, BuildContext context) async {
    try {
      final dynamic allMeditation = meditationBox.get("meditation_data");
      List<Map<String, dynamic>> meditationList = [];

      if (allMeditation != null && allMeditation is List) {
        meditationList = List<Map<String, dynamic>>.from(allMeditation
            .map((meditation) => Map<String, dynamic>.from(meditation)));
      }
      meditationList.add(meditation.toJson());
      meditationBox.put("meditation_data", meditationList);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Meditation Added!"),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      print("service error : $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Faild to add new meditation!"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
