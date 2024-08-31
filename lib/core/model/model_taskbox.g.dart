// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_taskbox.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskmodelAdapter extends TypeAdapter<Taskmodel> {
  @override
  final int typeId = 1;

  @override
  Taskmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Taskmodel(
      id: fields[0] as String,
      title: fields[1] as String,
      descrption: fields[2] as String,
      date: fields[3] as String,
      start_time: fields[4] as String,
      end_time: fields[5] as String,
      color: fields[6] as int,
      iscomplet: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Taskmodel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.descrption)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.start_time)
      ..writeByte(5)
      ..write(obj.end_time)
      ..writeByte(6)
      ..write(obj.color)
      ..writeByte(7)
      ..write(obj.iscomplet);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
