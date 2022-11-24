import 'package:erevho/core/data/hive/entity.dart';
import 'package:erevho/domain/entities/dreamer/enums/animal_enum.dart';

/// Just define the of the app.
/// Just have two information : a [pseudonym] and an [animal].
/// One app will always have a user associated with this information.
abstract class Dreamer extends Entity {
  final String pseudonym;
  final AnimalEnum animal;

  Dreamer({required super.id, required this.pseudonym, required this.animal});
}
