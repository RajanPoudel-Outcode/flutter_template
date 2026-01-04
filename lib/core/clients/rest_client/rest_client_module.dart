import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../config/flavor_config.dart';
import 'auth_api_client/auth_api_client.dart';
import 'authorized_api_client/authorized_api_client.dart';
import 'interceptors/content_type_interceptor.dart';
import 'interceptors/null_response_interceptor.dart';

@module
abstract class RestClientModule {
  @Named('dioInstance')
  @lazySingleton
  Dio get basicDio {
    final dio = Dio(BaseOptions(baseUrl: FlavorConfig.baseUrl()));
    dio.interceptors.clear();

    if (!kReleaseMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
      // dio.interceptors
      //     .add(getIt<ApiLogService>().aliceInterceptor);
    }

    // dio.interceptors.add(BasicAuthHeaderInterceptor());
    // dio.interceptors.add(AppHeaderInterceptor(getIt<DeviceInformationRetrievalService>()));
    dio.interceptors.add(NullResponseInterceptor());
    dio.interceptors.add(ContentTypeInterceptor());

    return dio;
  }

  @factoryMethod
  AuthApiClient getAuthApiClient(@Named('dioInstance') Dio dio) {
    return AuthApiClient(dio);
  }

  @Named('authorizedInstance')
  @lazySingleton
  Dio get authorizedDio {
    final dio = Dio(BaseOptions(baseUrl: FlavorConfig.baseUrl()));
    dio.interceptors.clear();

    if (!kReleaseMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
      // dio.interceptors
      //     .add(Injector.instance<ApiLogService>().aliceInterceptor);
    }

    dio.interceptors.add(NullResponseInterceptor());
    dio.interceptors.add(ContentTypeInterceptor());
    // dio.interceptors.add(AppHeaderInterceptor(getIt<DeviceInformationRetrievalService>()));
    // dio.interceptors.add(
    //   BearerTokenInterceptor(localDataSource: getIt.call<AuthLocalDataSource>()),
    // );
    // dio.interceptors.add(
    //   RefreshTokenInterceptor(
    //     remoteDataSource: getIt.call<RefreshTokenRemoteDataSource>(),
    //     localDataSource: getIt.call<AuthLocalDataSource>(),
    //   ),
    // );

    return dio;
  }

  @factoryMethod
  AuthorizedApiClient getAuthorizedApiClient(@Named('authorizedInstance') Dio dio) {
    return AuthorizedApiClient(dio);
  }
}
