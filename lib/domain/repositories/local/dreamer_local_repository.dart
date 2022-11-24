import 'package:erevho/domain/entities/dreamer/dreamer.entity.dart';

abstract class DreamerLocalRepository {
  Future<int> createOne(Dreamer dreamer);
  Future updateOne(Dreamer dreamer);
  Future<List<Dreamer>> getAll();
}
