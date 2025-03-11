import 'package:hive/hive.dart';
part 'mindfulness_exercise_model.g.dart';

@HiveType(typeId: 1)
class MindfulnessExerciseModel {

  @HiveField(0)
  final String category;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final List<String> instructions;

  @HiveField(4)
  final int duration;

  @HiveField(5)
  final String instructionsUrl;

  @HiveField(6)
  final String imagePath;

  MindfulnessExerciseModel({
    required this.category,
    required this.name,
    required this.description,
    required this.instructions,
    required this.duration,
    required this.instructionsUrl,
    required this.imagePath,
  });

  // methode to convert the Json Data in to a MindfulnessExercise Dart Object
  factory MindfulnessExerciseModel.fromJson(Map<String, dynamic> json) {
    return MindfulnessExerciseModel(
      category: json["category"],
      name: json["name"],
      description: json["description"],
      instructions: List<String>.from(json["instructions"]),
      duration: json["duration"],
      instructionsUrl: json["instructions_url"],
      imagePath: json["image_path"],
    );
  }

  // methode to convert the MindfulnessExerciseModel dart object in to a Json Data
  Map<String, dynamic> toJson() {
    return {
      "category": category,
      "name": name,
      "description": description,
      "instructions": instructions,
      "duration": duration,
      "instructions_url": instructionsUrl,
      "image_path": imagePath,
    };
  }
}
