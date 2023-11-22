// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultDataAdapter extends TypeAdapter<ResultData> {
  @override
  final int typeId = 0;

  @override
  ResultData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResultData()
      ..win = fields[0] as int
      ..lose = fields[1] as int
      ..draw = fields[2] as int;
  }

  @override
  void write(BinaryWriter writer, ResultData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.win)
      ..writeByte(1)
      ..write(obj.lose)
      ..writeByte(2)
      ..write(obj.draw);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
