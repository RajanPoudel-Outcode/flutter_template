import 'package:dio/dio.dart';
import 'package:flutter_template/core/constants/endpoints.dart';
import 'package:flutter_template/core/injection/injection.dart';
import 'package:flutter_template/core/models/response_wrapper.dart';
import 'package:flutter_template/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter_template/features/auth/data/models/refresh_token_model.dart';
import 'package:injectable/injectable.dart';

abstract class RefreshTokenRemoteDataSource {
  Future<ResponseWrapper<RefreshTokenModel>> refreshToken({required String refreshToken});
}

@LazySingleton(as: RefreshTokenRemoteDataSource)
class RefreshTokenRemoteDataSourceImpl implements RefreshTokenRemoteDataSource {
  final AuthLocalDataSource _authLocalDataSource;
  RefreshTokenRemoteDataSourceImpl(this._authLocalDataSource);

  @override
  Future<ResponseWrapper<RefreshTokenModel>> refreshToken({required String refreshToken}) async {
    final dio = getIt.get<Dio>(instanceName: 'dioInstance');
    final CancelToken cancelToken = CancelToken();
    final response = await dio.post(
      Endpoints.refreshToken,
      cancelToken: cancelToken,
      options: Options(
        headers: {'Authorization': 'Bearer $refreshToken', 'Content-Type': 'application/json'},
      ),
    );
    await _authLocalDataSource.cacheToken(response.data['data']['jwt']);
    return ResponseWrapper.fromJson(
      response.data,
      (data) => RefreshTokenModel.fromJson(data as Map<String, dynamic>),
    );
  }
}
