// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../data/datasources/local/dream_local_data_source.dart' as _i4;
import '../../data/repositories/local/dream_local_repository_impl.dart' as _i6;
import '../../domain/repositories/local/dream_local_repository.dart' as _i5;
import '../../domain/usecases/dream/create_dream_usecase.dart' as _i10;
import '../../domain/usecases/dream/delete_all_dreams_usecase.dart' as _i11;
import '../../domain/usecases/dream/get_all_dreams_usecase.dart' as _i7;
import '../../domain/usecases/dream/get_one_dream_usecase.dart' as _i8;
import '../../domain/usecases/dream/update_one_dream_usecase.dart' as _i9;
import 'local_module.dart' as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final localModule = _$LocalModule();
  await gh.factoryAsync<_i3.SharedPreferences>(
      () => localModule.sharedPreferences,
      preResolve: true);
  gh.singleton<String>(localModule.idGenerated);
  gh.singleton<_i4.DreamLocalDataSource>(
      _i4.DreamLocalDataSource(boxName: get<String>()));
  gh.singleton<_i5.DreamLocalRepository>(
      _i6.DreamLocalRepositoryImpl(get<_i4.DreamLocalDataSource>()));
  gh.factory<_i7.GetAllDreamsUsecase>(
      () => _i7.GetAllDreamsUsecase(get<_i5.DreamLocalRepository>()));
  gh.factory<_i8.GetOneDreamUsecase>(
      () => _i8.GetOneDreamUsecase(get<_i5.DreamLocalRepository>()));
  gh.factory<_i9.UpdateOneDreamUsecase>(
      () => _i9.UpdateOneDreamUsecase(get<_i5.DreamLocalRepository>()));
  gh.factory<_i10.CreateDreamUsecase>(
      () => _i10.CreateDreamUsecase(get<_i5.DreamLocalRepository>()));
  gh.factory<_i11.DeleteAllDreamsUsecase>(
      () => _i11.DeleteAllDreamsUsecase(get<_i5.DreamLocalRepository>()));
  return get;
}

class _$LocalModule extends _i12.LocalModule {}
