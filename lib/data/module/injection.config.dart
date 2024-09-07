// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bank_mobile/app/common/colors/default_theme_colors.dart'
    as _i218;
import 'package:bank_mobile/data/api/auth_api.dart' as _i504;
import 'package:bank_mobile/data/api/employee_api.dart' as _i1065;
import 'package:bank_mobile/data/api/home_api.dart' as _i792;
import 'package:bank_mobile/data/intercepter/auth_interceptor.dart' as _i439;
import 'package:bank_mobile/data/module/app_module.dart' as _i210;
import 'package:bank_mobile/data/module/network_module.dart' as _i904;
import 'package:bank_mobile/data/storage/storage.dart' as _i694;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:logger/web.dart' as _i120;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    final networkModule = _$NetworkModule();
    gh.singleton<_i218.DefaultThemeColors>(() => _i218.DefaultThemeColors());
    gh.lazySingleton<_i974.Logger>(() => appModule.logger);
    await gh.lazySingletonAsync<_i694.Storage>(
      () => _i694.Storage.create(),
      preResolve: true,
    );
    gh.lazySingleton<_i439.AuthInterceptor>(() => _i439.AuthInterceptor(
          gh<_i694.Storage>(),
          gh<_i120.Logger>(),
        ));
    gh.factory<_i361.Dio>(() => networkModule.dio(gh<_i439.AuthInterceptor>()));
    gh.factory<_i792.HomeApi>(() => _i792.HomeApi(gh<_i361.Dio>()));
    gh.factory<_i504.AuthApi>(() => _i504.AuthApi(gh<_i361.Dio>()));
    gh.factory<_i1065.EmployeeApi>(() => _i1065.EmployeeApi(gh<_i361.Dio>()));
    return this;
  }
}

class _$AppModule extends _i210.AppModule {}

class _$NetworkModule extends _i904.NetworkModule {}
