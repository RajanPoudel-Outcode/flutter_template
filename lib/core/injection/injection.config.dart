// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i833;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_template/core/app_theme/app_theme_cubit.dart' as _i1067;
import 'package:flutter_template/core/clients/rest_client/auth_api_client/auth_api_client.dart'
    as _i318;
import 'package:flutter_template/core/clients/rest_client/authorized_api_client/authorized_api_client.dart'
    as _i477;
import 'package:flutter_template/core/clients/rest_client/rest_client_module.dart'
    as _i475;
import 'package:flutter_template/core/db/share_pref_manager.dart' as _i822;
import 'package:flutter_template/core/routes/app_routes.dart' as _i659;
import 'package:flutter_template/core/services/device_information_retrieval_service/device_information_retrieval_service.dart'
    as _i830;
import 'package:flutter_template/core/services/device_information_retrieval_service/device_information_retrieval_service_impl.dart'
    as _i505;
import 'package:flutter_template/core/services/local_storage_service/local_storage_service.dart'
    as _i242;
import 'package:flutter_template/core/services/local_storage_service/secured_storage_service.dart'
    as _i149;
import 'package:flutter_template/core/services/services_module.dart' as _i734;
import 'package:flutter_template/features/auth/data/datasources/auth_local_data_source.dart'
    as _i95;
import 'package:flutter_template/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i20;
import 'package:flutter_template/features/auth/data/datasources/refresh_token_remote_data_source.dart'
    as _i394;
import 'package:flutter_template/features/auth/data/repositories/auth_repository_impl.dart'
    as _i1072;
import 'package:flutter_template/features/auth/domain/repositories/auth_repository.dart'
    as _i1052;
import 'package:flutter_template/features/auth/presentation/cubit/authentication_cubit.dart'
    as _i1032;
import 'package:flutter_template/features/auth/presentation/login/cubit/login_cubit.dart'
    as _i537;
import 'package:flutter_template/features/term_conditions/data/datasources/term_conditions_remote_data_source.dart'
    as _i664;
import 'package:flutter_template/features/term_conditions/data/repositories/term_conditions_repository_impl.dart'
    as _i750;
import 'package:flutter_template/features/term_conditions/domain/repositories/term_conditions_repository.dart'
    as _i82;
import 'package:flutter_template/features/term_conditions/presentation/cubit/term_conditions_cubit.dart'
    as _i101;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:package_info_plus/package_info_plus.dart' as _i655;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharePrefManager = _$SharePrefManager();
    final servicesModule = _$ServicesModule();
    final restClientModule = _$RestClientModule();
    gh.factory<_i1067.AppThemeCubit>(() => _i1067.AppThemeCubit());
    gh.factory<_i659.AppRouter>(() => _i659.AppRouter());
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => sharePrefManager.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i833.DeviceInfoPlugin>(
      () => servicesModule.deviceInfoPlugin,
    );
    await gh.lazySingletonAsync<_i655.PackageInfo>(
      () => servicesModule.packageInfo,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(
      () => restClientModule.basicDio,
      instanceName: 'dioInstance',
    );
    gh.lazySingleton<_i361.Dio>(
      () => restClientModule.authorizedDio,
      instanceName: 'authorizedInstance',
    );
    gh.singleton<_i242.LocalStorageService>(
      () => _i149.SecuredStorageService(),
    );
    gh.factory<_i318.AuthApiClient>(
      () => restClientModule.getAuthApiClient(
        gh<_i361.Dio>(instanceName: 'dioInstance'),
      ),
    );
    gh.lazySingleton<_i95.AuthLocalDataSource>(
      () => _i95.AuthLocalDataSourceImpl(gh<_i242.LocalStorageService>()),
    );
    gh.lazySingleton<_i394.RefreshTokenRemoteDataSource>(
      () => _i394.RefreshTokenRemoteDataSourceImpl(
        gh<_i95.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i477.AuthorizedApiClient>(
      () => restClientModule.getAuthorizedApiClient(
        gh<_i361.Dio>(instanceName: 'authorizedInstance'),
      ),
    );
    gh.lazySingleton<_i830.DeviceInformationRetrievalService>(
      () => _i505.DeviceInformationRetrievalServiceImpl(
        deviceInfoPlugin: gh<_i833.DeviceInfoPlugin>(),
        packageInfo: gh<_i655.PackageInfo>(),
      ),
    );
    gh.lazySingleton<_i664.TermConditionsRemoteDataSource>(
      () => _i664.TermConditionsRemoteDataSourceImpl(
        gh<_i477.AuthorizedApiClient>(),
      ),
    );
    gh.lazySingleton<_i20.AuthRemoteDataSource>(
      () => _i20.AuthRemoteDataSourceImpl(
        gh<_i477.AuthorizedApiClient>(),
        gh<_i318.AuthApiClient>(),
      ),
    );
    gh.lazySingleton<_i82.TermConditionsRepository>(
      () => _i750.TermConditionsRepositoryImpl(
        remoteDataSource: gh<_i664.TermConditionsRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i1052.AuthRepository>(
      () => _i1072.AuthRepositoryImpl(
        remoteDataSource: gh<_i20.AuthRemoteDataSource>(),
        localDataSource: gh<_i95.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i101.TermConditionsCubit>(
      () => _i101.TermConditionsCubit(
        termConditionsRepository: gh<_i82.TermConditionsRepository>(),
      ),
    );
    gh.factory<_i537.LoginCubit>(
      () => _i537.LoginCubit(authRepository: gh<_i1052.AuthRepository>()),
    );
    gh.lazySingleton<_i1032.AuthenticationCubit>(
      () => _i1032.AuthenticationCubit(
        authRepository: gh<_i1052.AuthRepository>(),
      ),
    );
    return this;
  }
}

class _$SharePrefManager extends _i822.SharePrefManager {}

class _$ServicesModule extends _i734.ServicesModule {}

class _$RestClientModule extends _i475.RestClientModule {}
