// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tag _$TagFromJson(Map<String, dynamic> json) {
  return _Tag.fromJson(json);
}

/// @nodoc
mixin _$Tag {
  @JsonKey(name: 'id', required: true, disallowNullValue: true)
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  TagColor get tagColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagCopyWith<Tag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagCopyWith<$Res> {
  factory $TagCopyWith(Tag value, $Res Function(Tag) then) =
      _$TagCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true)
      @HiveField(0)
          String id,
      @HiveField(1)
          String title,
      @HiveField(2)
          TagColor tagColor});
}

/// @nodoc
class _$TagCopyWithImpl<$Res> implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._value, this._then);

  final Tag _value;
  // ignore: unused_field
  final $Res Function(Tag) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? tagColor = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tagColor: tagColor == freezed
          ? _value.tagColor
          : tagColor // ignore: cast_nullable_to_non_nullable
              as TagColor,
    ));
  }
}

/// @nodoc
abstract class _$$_TagCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$$_TagCopyWith(_$_Tag value, $Res Function(_$_Tag) then) =
      __$$_TagCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true)
      @HiveField(0)
          String id,
      @HiveField(1)
          String title,
      @HiveField(2)
          TagColor tagColor});
}

/// @nodoc
class __$$_TagCopyWithImpl<$Res> extends _$TagCopyWithImpl<$Res>
    implements _$$_TagCopyWith<$Res> {
  __$$_TagCopyWithImpl(_$_Tag _value, $Res Function(_$_Tag) _then)
      : super(_value, (v) => _then(v as _$_Tag));

  @override
  _$_Tag get _value => super._value as _$_Tag;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? tagColor = freezed,
  }) {
    return _then(_$_Tag(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tagColor: tagColor == freezed
          ? _value.tagColor
          : tagColor // ignore: cast_nullable_to_non_nullable
              as TagColor,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: tagId, adapterName: 'TagAdapter')
class _$_Tag implements _Tag {
  const _$_Tag(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true)
      @HiveField(0)
          required this.id,
      @HiveField(1)
          required this.title,
      @HiveField(2)
          required this.tagColor});

  factory _$_Tag.fromJson(Map<String, dynamic> json) => _$$_TagFromJson(json);

  @override
  @JsonKey(name: 'id', required: true, disallowNullValue: true)
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final TagColor tagColor;

  @override
  String toString() {
    return 'Tag(id: $id, title: $title, tagColor: $tagColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tag &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.tagColor, tagColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(tagColor));

  @JsonKey(ignore: true)
  @override
  _$$_TagCopyWith<_$_Tag> get copyWith =>
      __$$_TagCopyWithImpl<_$_Tag>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagToJson(this);
  }
}

abstract class _Tag implements Tag {
  const factory _Tag(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true)
      @HiveField(0)
          required final String id,
      @HiveField(1)
          required final String title,
      @HiveField(2)
          required final TagColor tagColor}) = _$_Tag;

  factory _Tag.fromJson(Map<String, dynamic> json) = _$_Tag.fromJson;

  @override
  @JsonKey(name: 'id', required: true, disallowNullValue: true)
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  TagColor get tagColor => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TagCopyWith<_$_Tag> get copyWith => throw _privateConstructorUsedError;
}
