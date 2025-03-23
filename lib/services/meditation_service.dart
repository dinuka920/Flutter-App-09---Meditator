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

  // method to get a meditation from local storage
  List<MeditationExerciseModel> getMeditation() {
    try {
      final dynamic allMeditations = meditationBox.get("meditation_data");
      if (allMeditations != null && allMeditations is List) {
        return allMeditations.map((meditation) {
          if (allMeditations is Map<String, dynamic>) {
            return MeditationExerciseModel.fromJson(meditation);
          } else {
            return MeditationExerciseModel.fromJson(
              Map<String, dynamic>.from(meditation),
            );
          }
        }).toList();
      } else {
        return [];
      }
    } catch (error) {
      print("servise load error : $error");
      return [];
    }
  }

  // methode to delete meditation from local Storage
  Future<void> deleteMeditation(
      MeditationExerciseModel meditationExercise, BuildContext context) async {
    try {
      final dynamic allMeditations = meditationBox.get("meditation_data");
      List<Map<String, dynamic>> meditationList =
          List<Map<String, dynamic>>.from(
        allMeditations.map(
          (meditation) => Map<String, dynamic>.from(meditation),
        ),
      );
      meditationList.removeWhere((meditation) {
        MeditationExerciseModel curruntMeditation =
            MeditationExerciseModel.fromJson(
                Map<String, dynamic>.from(meditation));
        return curruntMeditation.name == meditationExercise.name &&
            curruntMeditation.category == meditationExercise.category;
      });
      await meditationBox.put("meditation_data", meditationList);

      // show snack bar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Meditation Deleted!"),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      print("service delete error : $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error Dileting Meditation!"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
