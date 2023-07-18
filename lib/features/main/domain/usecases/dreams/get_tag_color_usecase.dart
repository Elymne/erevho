import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getTagColorUsecaseProvider = Provider((ref) => GetTagColorUsecase());

/// TODO gérer les couleurs si pas trop la flemme.
class GetTagColorUsecase extends Usecase<List<Color>, GetTagColorUsecaseParams> {
  @override
  Future<List<Color>> perform(GetTagColorUsecaseParams params) async {
    return [Colors.blue.shade400];
  }
}

class GetTagColorUsecaseParams extends Params {
  final String tagText;
  GetTagColorUsecaseParams(this.tagText);
}
