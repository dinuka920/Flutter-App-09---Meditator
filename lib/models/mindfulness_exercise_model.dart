class MindfulnessExerciseModel {
  final String category;
  final String name;
  final String description;
  final List<String> instructions;
  final int duration;
  final String instructionsUrl;
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
