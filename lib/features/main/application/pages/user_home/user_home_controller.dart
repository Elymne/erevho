import 'package:erevho/core/controller.dart';
import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userHomeControllerProvider = Provider((ref) => UserHomeController(ref));

class UserHomeController extends Controller {
  late final AppLocalisationTools alt = ref.read(appLocalisationToolsProvider);

  late final PageController pageController = PageController(
    initialPage: ref.read(currentPageProvider),
  );

  final currentTitleTextProvider = StateProvider<String>((ref) => "");
  final isTopContentVisibleProvider = StateProvider<bool>((ref) => true);
  final currentPageProvider = StateProvider<int>((ref) => 1);

  Future init() async {
    ref.read(currentTitleTextProvider.notifier).state = alt.current.home_user_title_1;
  }

  UserHomeController(super.ref);

  void goToCreatePage() {
    _updatePageController(0);
    _updateTopContent(0);
  }

  void goToMainHomePage() {
    _updatePageController(1);
    _updateTopContent(1);
  }

  void goToListPage() {
    _updatePageController(2);
    _updateTopContent(2);
  }

  void _updatePageController(int newCurrentPage) {
    pageController.animateToPage(
      newCurrentPage,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  Future _updateTopContent(int newCurrentPage) async {
    switch (newCurrentPage) {
      case 0:
        _startTopContentAnimation(alt.current.home_user_title_3, newCurrentPage);
        break;
      case 1:
        _startTopContentAnimation(alt.current.home_user_title_1, newCurrentPage);
        break;
      case 2:
        _startTopContentAnimation(alt.current.home_user_title_2, newCurrentPage);
        break;
    }
  }

  Future _startTopContentAnimation(String newCurrentTitleProvider, int newCurrentPage) async {
    ref.read(isTopContentVisibleProvider.notifier).state = false;
    await Future.delayed(const Duration(milliseconds: 400));
    ref.read(currentPageProvider.notifier).state = newCurrentPage;
    ref.read(currentTitleTextProvider.notifier).state = newCurrentTitleProvider;
    ref.read(isTopContentVisibleProvider.notifier).state = true;
  }

  void onPushBack(BuildContext context) {
    Navigator.pop(context);
  }
}
