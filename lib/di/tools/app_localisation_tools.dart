import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppLocalisationTools {
  late AppLocalizations _appLocalizations;

  /// Set the current langage.
  /// Setup this at the beggining of the app.
  /// [Locale] object can be : Locale('FR', 'fr') for example.
  void setLocale(Locale locale) async {
    try {
      _appLocalizations = await AppLocalizations.delegate.load(locale);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  /// Get the actual appLocalizations to get string translation from arb files.
  AppLocalizations get current => _appLocalizations;
}
