// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorymodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategorymodelAdapter extends TypeAdapter<Categorymodel> {
  @override
  final int typeId = 1;

  @override
  Categorymodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Categorymodel(
      id: fields[0] as String,
      type: fields[3] as Category,
      name: fields[1] as String,
      isDeleted: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Categorymodel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isDeleted)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategorymodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 2;

  @override
  Category read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Category.income;
      case 1:
        return Category.expense;
      default:
        return Category.income;
    }
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    switch (obj) {
      case Category.income:
        writer.writeByte(0);
        break;
      case Category.expense:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
