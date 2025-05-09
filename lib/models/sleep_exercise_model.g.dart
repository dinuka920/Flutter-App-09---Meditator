// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_exercise_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SleepExerciseModelAdapter extends TypeAdapter<SleepExerciseModel> {
  @override
  final int typeId = 2;

  @override
  SleepExerciseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SleepExerciseModel(
      category: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      duration: fields[3] as int,
      audioUrl: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SleepExerciseModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.audioUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SleepExerciseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
