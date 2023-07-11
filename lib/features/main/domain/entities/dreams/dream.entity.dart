import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'dream.entity.freezed.dart';

@freezed
class Dream with _$Dream {
  @Entity(realClass: Dream)
  const factory Dream({
    @Id(assignable: true) required int id,
    @Unique() required String uid,
    required String pseudonym,
    required String title,
    required String content,
    required String tags,
    @Property(type: PropertyType.date) required DateTime created,
    @Property(type: PropertyType.date) required DateTime updated,
  }) = _Dream;
}
