import 'package:erevho/core/controller.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SplashscreenController extends Controller {
  SplashscreenController(super.appRouter);

  @override
  void init(BuildContext context) async {
    super.init(context);

    await Future.delayed(const Duration(seconds: 2));
  }
}
