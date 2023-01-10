import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/features/dreams/application/navigation/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Controller {
  /// Riverpod statemanagement value.
  final ProviderRef ref;

  /// Routing service.
  final AppRouter appRouter;

  /// Translation service.
  final AppLocalisationTools alt;

  Controller(this.ref)
      : appRouter = ref.read(appRouterProvider),
        alt = ref.read(appLocalisationToolsProvider);
}
