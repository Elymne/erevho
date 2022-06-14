import 'package:erevho/core/data/entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveCrud<T extends Entity, R> {
  String boxName;

  HiveCrud({required this.boxName});

  /// Open connection to table.
  Future<Box<T>> open() => Hive.openBox<T>(boxName);

  /// Clear all data from table.
  Future<int> clearAll() async {
    final box = await open();
    return box.clear();
  }

  /// Get all data from table.
  Future<List<T>> getAll() async {
    final box = await open();
    return box.values.toList();
  }

  /// Get one value by it's ID.
  Future<T> getOne(R id) async {
    final box = await open();
    return box.values.firstWhere((element) => element.id == id);
  }

  /// Save all data in table.
  Future<Iterable<int>> saveAll(List<T> elements) async {
    final box = await open();
    return box.addAll(elements);
  }

  /// Save one data.
  Future<int> saveOne(T element) async {
    final box = await open();
    return box.add(element);
  }

  /// Update one.
  Future updateOne(T newElement) async {
    final box = await open();
    final elements = box.values.toList();
    final key = elements.indexWhere((element) => element.id == newElement.id);
    box.putAt(key, newElement);
  }

  /// Delete one data from table.
  Future deleteOne(R id) async {
    final box = await open();
    final elements = box.values.toList();
    final key = elements.indexWhere((element) => element.id == id);
    box.delete(key);
  }

  /// Delete data from thier ids given into params.
  Future deleteAll(List<R> deletedIds) async {
    final box = await open();
    final elements = box.values.toList();
    final idKeys = deletedIds.map((id) {
      return elements.indexWhere((element) => element.id == id);
    });
    box.deleteAll(idKeys);
  }
}
