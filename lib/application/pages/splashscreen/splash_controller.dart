import 'package:erevho/application/navigation/routes.dart';
import 'package:erevho/core/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

/// Splash
@Injectable()
class SplashController extends Controller {
  @override
  void init({BuildContext? context, WidgetRef? ref}) async {
    super.init(context: context, ref: ref);
    await Future.delayed(const Duration(seconds: 2));
    appRouter.navigate(context!, home);
  }
}
