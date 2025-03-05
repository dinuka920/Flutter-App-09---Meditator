class SleepExerciseModel {
  final String category;
  final String name;
  final String description;
  final int duration;
  final String audioUrl;

  SleepExerciseModel({
    required this.category,
    required this.name,
    required this.description,
    required this.duration,
    required this.audioUrl,
  });

  // methode to the convert to Json Data in to a sleepExerciseModel
  factory SleepExerciseModel.fromJson(Map<String, dynamic> json) {
    return SleepExerciseModel(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'], 
      audioUrl: json['audio_url'],
    );
  }

  // convert to the sleepExerciseModel in to a Json data
  Map<String, dynamic> tojson() {
    return {
      'category': category,
      'name': name,
      'description': description,
      'duration': duration,
      'audio_url': audioUrl,
    };
  }
}
