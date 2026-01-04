// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_template/core/app_theme/app_theme_cubit.dart' as _i1067;
import 'package:flutter_template/core/clients/rest_client/auth_api_client/auth_api_client.dart'
    as _i318;
import 'package:flutter_template/core/clients/rest_client/authorized_api_client/authorized_api_client.dart'
    as _i477;
import 'package:flutter_template/core/clients/rest_client/rest_client_module.dart'
    as _i475;
import 'package:flutter_template/core/routes/app_routes.dart' as _i659;
import 'package:flutter_template/core/services/share_service.dart' as _i1041;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final restClientModule = _$RestClientModule();
    gh.factory<_i1067.AppThemeCubit>(() => _i1067.AppThemeCubit());
    gh.factory<_i659.AppRouter>(() => _i659.AppRouter());
    gh.factory<_i1041.ShareService>(() => _i1041.ShareService());
    gh.lazySingleton<_i361.Dio>(
      () => restClientModule.basicDio,
      instanceName: 'dioInstance',
    );
    gh.lazySingleton<_i361.Dio>(
      () => restClientModule.authorizedDio,
      instanceName: 'authorizedInstance',
    );
    gh.factory<_i318.AuthApiClient>(
      () => restClientModule.getAuthApiClient(
        gh<_i361.Dio>(instanceName: 'dioInstance'),
      ),
    );
    gh.factory<_i477.AuthorizedApiClient>(
      () => restClientModule.getAuthorizedApiClient(
        gh<_i361.Dio>(instanceName: 'authorizedInstance'),
      ),
    );
    return this;
  }
}

class _$RestClientModule extends _i475.RestClientModule {}
