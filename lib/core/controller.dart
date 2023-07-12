import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Controller {
  /// Riverpod statemanagement value.
  final ProviderRef ref;

  /// Translation service.
  final AppLocalisationTools alt;

  Controller(this.ref) : alt = ref.read(appLocalisationToolsProvider);
}
