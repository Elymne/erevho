import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

/// This allows a value of type T or T?
/// to be treated as a value of type T?.
///
/// We use this so that APIs that have become
/// non-nullable can still be used with `!` and `?`
/// to support older versions of the API as well.
T? _ambiguate<T>(T? value) => value;

/// I have to override one function : onActiveChanged.
/// When animation is finished, this one is reseted, and I don't want that to chain my animations. (It create a on frame flashy effetc).
class CustomOneShotController extends OneShotAnimation {
  // super.
  CustomOneShotController(super.animationName, {super.autoplay, super.onStart, super.onStop, super.mix});

  @override
  void onActiveChanged() {
    // ! This is where I remove the reset.
    if (!isActive) {
      // reset();
    }

    // Fire any callbacks
    isActive
        ? onStart?.call()
        // onStop can fire while widgets are still drawing
        : _ambiguate(WidgetsBinding.instance)?.addPostFrameCallback((_) => onStop?.call());
  }
}
