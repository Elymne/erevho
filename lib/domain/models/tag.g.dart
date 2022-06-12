// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TagAdapter extends TypeAdapter<_$_Tag> {
  @override
  final int typeId = 1;

  @override
  _$_Tag read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Tag(
      id: fields[0] as String,
      title: fields[1] as String,
      tagColor: fields[2] as TagColor,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Tag obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.tagColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TagAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tag _$$_TagFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
    disallowNullValues: const ['id'],
  );
  return _$_Tag(
    id: json['id'] as String,
    title: json['title'] as String,
    tagColor: $enumDecode(_$TagColorEnumMap, json['tagColor']),
  );
}

Map<String, dynamic> _$$_TagToJson(_$_Tag instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'tagColor': _$TagColorEnumMap[instance.tagColor],
    };

const _$TagColorEnumMap = {
  TagColor.black: 'black',
  TagColor.white: 'white',
  TagColor.blue: 'blue',
  TagColor.red: 'red',
};
