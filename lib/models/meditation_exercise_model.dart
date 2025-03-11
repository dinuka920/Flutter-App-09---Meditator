import 'package:hive/hive.dart';
part 'meditation_exercise_model.g.dart';

@HiveType(typeId: 0)
class MeditationExerciseModel {

  @HiveField(0)
  final String category;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final int duration;

  @HiveField(4)
  final String audioUrl;

  @HiveField(5)
  final String videoUrl;

  MeditationExerciseModel({
    required this.category,
    required this.name,
    required this.description,
    required this.duration,
    required this.audioUrl,
    required this.videoUrl,
  });

  // methode to convert the Json data in to a MeditationExerciseModel
  factory MeditationExerciseModel.fromJson(Map<String, dynamic> json) {
    return MeditationExerciseModel(
      category: json["category"],
      name: json["name"],
      description: json["description"],
      duration: json["duration"],
      audioUrl: json["audio_url"],
      videoUrl: json["video_url"],
    );
  }

  // methode to the convert the MeditationExerciseModel in to a Json data
  Map<String, dynamic> toJson() {
    return {
      "category": category,
      "name": name,
      "description": description,
      "duration": duration,
      "audio_url": audioUrl,
      "video_url": videoUrl,
    };
  }
}
