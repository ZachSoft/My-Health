// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BotChatModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BotchatModelAdapter extends TypeAdapter<BotchatModel> {
  @override
  final int typeId = 0;

  @override
  BotchatModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BotchatModel(
      role: fields[0] as String,
      parts: (fields[1] as List).cast<PartChatModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, BotchatModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.role)
      ..writeByte(1)
      ..write(obj.parts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BotchatModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
