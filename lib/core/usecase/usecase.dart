import 'package:erevho/core/usecase/params.dart';

abstract class Usecase<T, P extends Params> {
  Future<T> perform(P params);
}

abstract class UsecaseNoParams<T> {
  Future<T> perform();
}
