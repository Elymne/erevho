import 'package:erevho/core/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userHomeControllerProvider = Provider((ref) => UserHomeController(ref));

class UserHomeController extends Controller {
  final PageController pageController = PageController(
    initialPage: 1,
  );

  Future init() async {}

  UserHomeController(super.ref);

  void goToListPage() {
    print("WHEHHEHHE");
    pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.bounceIn,
    );
  }
}
