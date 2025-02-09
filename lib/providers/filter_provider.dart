import 'package:flutter/material.dart';
import 'package:meditator_app/models/meditation_exercise_model.dart';
import 'package:meditator_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';
import 'package:meditator_app/providers/meditation_exercise_provider.dart';
import 'package:meditator_app/providers/mindfull_exercise_provider.dart';
import 'package:meditator_app/providers/sleep_exercise_provider.dart';
import 'package:provider/provider.dart';

class FilterProvider extends ChangeNotifier {
  List<dynamic> _allData = [];
  List<dynamic> _filteredData = [];
  String _selectedCategory = "All";

  // get all the data from other providers
  Future<void> getData(BuildContext context) async {
    // ensures this runs after build
    await Future.delayed(Duration.zero);

    // mindfull exercises
    final List<MindfulnessExerciseModel> mindfullExercises =
        Provider.of<MindfullExerciseProvider>(context, listen: false)
            .mindfullExercises;

    // meditation exercises
    final List<MeditationExerciseModel> meditationExercises =
        Provider.of<MeditationExerciseProvider>(context, listen: false)
            .meditationExercises;

    // sleep exercises
    final List<SleepExerciseModel> sleepExercises =
        Provider.of<SleepExerciseProvider>(context, listen: false)
            .sleepExercises;

    _allData = [
      ...mindfullExercises,
      ...meditationExercises,
      ...sleepExercises,
    ];
    _filteredData = _allData;

    notifyListeners();
  }

  // getter
  List<dynamic> get filterData => _filteredData;

  // methode to filter the data
  void filteredData(String category) {
    _selectedCategory = category;

    if (category == "All") {
      _filteredData = _allData;
    } else if (category == "Mindfullness") {
      _filteredData = _allData.whereType<MindfulnessExerciseModel>().toList();
    } else if (category == "Meditation") {
      _filteredData = _allData.whereType<MeditationExerciseModel>().toList();
    } else if (category == "Sleep Stories") {
      _filteredData = _allData.whereType<SleepExerciseModel>().toList();
    }

    notifyListeners();
  }

  // methode to retun the selected category
  String getSelectedCatagory() {
   return _selectedCategory;
  }
}
