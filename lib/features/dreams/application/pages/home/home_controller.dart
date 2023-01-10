import 'package:erevho/core/controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeControllerProvider = Provider((ref) => HomeController(ref));

class HomeController extends Controller {
  HomeController(super.ref);
}
