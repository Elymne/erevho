import 'package:erevho/features/main/data/models/dreams/dream.model.dart';
import 'package:erevho/features/main/data/models/user_data/user_data.model.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../../objectbox.g.dart';

class ObjectBox {
  /// The Store of this app.
  late final Store store;

  ObjectBox._create(this.store) {
    //clearData();
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(directory: p.join(docsDir.path, "erevoh-box"));
    return ObjectBox._create(store);
  }

  void clearData() {
    if (kDebugMode) {
      print('Clearing Db on debug mode');
      store.box<DreamModel>().removeAllAsync();
      store.box<UserDataModel>().removeAllAsync();
    }
  }
}
