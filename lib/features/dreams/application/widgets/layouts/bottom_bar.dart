import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/dreams/application/navigation/app_router.dart';
import 'package:erevho/features/dreams/application/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Custom bottom bar that should be displayed to HomePage.
/// It will allow us to navigate into multiple features from the app.
class BottomBar extends ConsumerWidget {
  final AppRouter appRouter;
  final PageSelected pageSelected;

  const BottomBar({Key? key, required this.pageSelected, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: nightGreyDarker,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () => _changePage(context, PageSelected.personnal == pageSelected ? PageSelected.none : PageSelected.personnal),
              child: Icon(
                Icons.home,
                color: PageSelected.personnal == pageSelected ? nightOrange : nightGrey,
                size: 40,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _changePage(context, PageSelected.create == pageSelected ? PageSelected.none : PageSelected.create),
            child: Icon(
              Icons.add,
              color: PageSelected.group == pageSelected ? nightOrange : nightGrey,
              size: 40,
            ),
          ),
          GestureDetector(
            onTap: () => _changePage(context, PageSelected.online == pageSelected ? PageSelected.none : PageSelected.online),
            child: Icon(
              Icons.online_prediction,
              color: PageSelected.online == pageSelected ? nightOrange : nightGrey,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }

  /// [context] Context is needed to use navigation.
  /// [pageSelected] The selected page.
  void _changePage(BuildContext context, PageSelected pageSelected) {
    switch (pageSelected) {
      case PageSelected.none:
        appRouter.navigate(context, home);
        break;
      case PageSelected.personnal:
        appRouter.navigate(context, personnal);
        break;
      case PageSelected.group:
        print('Access to group page : Not implemented');
        break;
      case PageSelected.online:
        print('Access to online page : Not implemented');
        break;
      case PageSelected.create:
        appRouter.navigate(context, dreamFormCreate);
        break;
    }
  }
}

/// Define each state of bottom bar.
/// [none] Corresponding to HomePage. Don't know what I should put in it. Maybe news or a bit of everything.
/// [personnal] Correponding to user offline dreams.
/// [group] Corresponding to user group. //TODO to be defined
/// [online] Corresponding to online dreams seach place. //TODO to be defined
enum PageSelected { none, create, personnal, group, online }
