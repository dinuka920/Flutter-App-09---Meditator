import 'package:flutter/material.dart';
import 'package:meditator_app/models/meditation_exercise_model.dart';
import 'package:meditator_app/services/meditation_service.dart';

class CustomDataProvider extends ChangeNotifier {
  final List<MeditationExerciseModel> _meditation = [];
  // getter
  List<MeditationExerciseModel> get meditation => _meditation;

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
}
