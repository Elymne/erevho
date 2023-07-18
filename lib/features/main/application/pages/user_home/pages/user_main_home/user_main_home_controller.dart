import 'package:erevho/core/controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userMainHomeController = Provider((ref) => UserMainHomeController(ref));

class UserMainHomeController extends Controller {
  UserMainHomeController(super.ref);
}
