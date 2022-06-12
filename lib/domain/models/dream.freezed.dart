// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dream.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dream _$DreamFromJson(Map<String, dynamic> json) {
  return _Dream.fromJson(json);
}

/// @nodoc
mixin _$Dream {
  @JsonKey(name: 'id', required: true, disallowNullValue: true)
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get pseudonym => throw _privateConstructorUsedError;
  @HiveField(2)
  String get title => throw _privateConstructorUsedError;
  @HiveField(3)
  List<Tag> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DreamCopyWith<Dream> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DreamCopyWith<$Res> {
  factory $DreamCopyWith(Dream value, $Res Function(Dream) then) =
      _$DreamCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true)
      @HiveField(0)
          String id,
      @HiveField(1)
          String pseudonym,
      @HiveField(2)
          String title,
      @HiveField(3)
          List<Tag> tags});
}

/// @nodoc
class _$DreamCopyWithImpl<$Res> implements $DreamCopyWith<$Res> {
  _$DreamCopyWithImpl(this._value, this._then);

  final Dream _value;
  // ignore: unused_field
  final $Res Function(Dream) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? pseudonym = freezed,
    Object? title = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pseudonym: pseudonym == freezed
          ? _value.pseudonym
          : pseudonym // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc
abstract class _$$_DreamCopyWith<$Res> implements $DreamCopyWith<$Res> {
  factory _$$_DreamCopyWith(_$_Dream value, $Res Function(_$_Dream) then) =
      __$$_DreamCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true)
      @HiveField(0)
          String id,
      @HiveField(1)
          String pseudonym,
      @HiveField(2)
          String title,
      @HiveField(3)
          List<Tag> tags});
}

/// @nodoc
class __$$_DreamCopyWithImpl<$Res> extends _$DreamCopyWithImpl<$Res>
    implements _$$_DreamCopyWith<$Res> {
  __$$_DreamCopyWithImpl(_$_Dream _value, $Res Function(_$_Dream) _then)
      : super(_value, (v) => _then(v as _$_Dream));

  @override
  _$_Dream get _value => super._value as _$_Dream;

  @override
  $Res call({
    Object? id = freezed,
    Object? pseudonym = freezed,
    Object? title = freezed,
    Object? tags = freezed,
  }) {
    return _then(_$_Dream(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pseudonym: pseudonym == freezed
          ? _value.pseudonym
          : pseudonym // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: dreamId, adapterName: 'DreamAdapter')
class _$_Dream implements _Dream {
  const _$_Dream(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true)
      @HiveField(0)
          required this.id,
      @HiveField(1)
          required this.pseudonym,
      @HiveField(2)
          required this.title,
      @HiveField(3)
          required final List<Tag> tags})
      : _tags = tags;

  factory _$_Dream.fromJson(Map<String, dynamic> json) =>
      _$$_DreamFromJson(json);

  @override
  @JsonKey(name: 'id', required: true, disallowNullValue: true)
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String pseudonym;
  @override
  @HiveField(2)
  final String title;
  final List<Tag> _tags;
  @override
  @HiveField(3)
  List<Tag> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'Dream(id: $id, pseudonym: $pseudonym, title: $title, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Dream &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.pseudonym, pseudonym) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(pseudonym),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  _$$_DreamCopyWith<_$_Dream> get copyWith =>
      __$$_DreamCopyWithImpl<_$_Dream>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DreamToJson(this);
  }
}

abstract class _Dream implements Dream {
  const factory _Dream(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true)
      @HiveField(0)
          required final String id,
      @HiveField(1)
          required final String pseudonym,
      @HiveField(2)
          required final String title,
      @HiveField(3)
          required final List<Tag> tags}) = _$_Dream;

  factory _Dream.fromJson(Map<String, dynamic> json) = _$_Dream.fromJson;

  @override
  @JsonKey(name: 'id', required: true, disallowNullValue: true)
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get pseudonym => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get title => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  List<Tag> get tags => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DreamCopyWith<_$_Dream> get copyWith =>
      throw _privateConstructorUsedError;
}
