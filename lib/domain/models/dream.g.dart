// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dream.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DreamAdapter extends TypeAdapter<_$_Dream> {
  @override
  final int typeId = 2;

  @override
  _$_Dream read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Dream(
      id: fields[0] as String,
      pseudonym: fields[1] as String,
      title: fields[2] as String,
      tags: (fields[3] as List).cast<Tag>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_Dream obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.pseudonym)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DreamAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Dream _$$_DreamFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
    disallowNullValues: const ['id'],
  );
  return _$_Dream(
    id: json['id'] as String,
    pseudonym: json['pseudonym'] as String,
    title: json['title'] as String,
    tags: (json['tags'] as List<dynamic>)
        .map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$$_DreamToJson(_$_Dream instance) => <String, dynamic>{
      'id': instance.id,
      'pseudonym': instance.pseudonym,
      'title': instance.title,
      'tags': instance.tags,
    };
