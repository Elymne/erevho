import 'package:erevho/objectbox.g.dart';
import '../../main.dart';

abstract class ObjectStore<T> {
  final Box<T> box = objectbox.store.box<T>();
}
