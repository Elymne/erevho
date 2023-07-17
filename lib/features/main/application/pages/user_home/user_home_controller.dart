import 'package:erevho/core/controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userHomeControllerProvider = Provider((ref) => UserHomeController(ref));

class UserHomeController extends Controller {
  UserHomeController(super.ref);
}
