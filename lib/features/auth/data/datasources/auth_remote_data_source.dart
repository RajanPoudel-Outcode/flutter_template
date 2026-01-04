import 'package:flutter_template/core/clients/rest_client/auth_api_client/auth_api_client.dart';
import 'package:flutter_template/core/clients/rest_client/authorized_api_client/authorized_api_client.dart';
import 'package:flutter_template/core/exceptions/exception_handler.dart';
import 'package:flutter_template/core/models/api_success_message_response.dart';
import 'package:flutter_template/core/models/response_wrapper.dart';
import 'package:flutter_template/features/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<ResponseWrapper<UserModel>> login(String email, String password);
  Future<ApiSuccessMessageResponse> signup(String email, String password);
  Future<ApiSuccessMessageResponse> resetPassword(String email);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final AuthorizedApiClient authorizedApiClient;
  final AuthApiClient authApiClient;

  AuthRemoteDataSourceImpl(this.authorizedApiClient, this.authApiClient);

  @override
  Future<ResponseWrapper<UserModel>> login(String email, String password) async {
    try {
      // response mock for testing without backend
      await Future.delayed(const Duration(seconds: 2));
      return ResponseWrapper(
        data: UserModel(id: '1', name: 'John Doe', accessToken: 'mock_access_token_1234567890'),
      );
      // return await authApiClient.login(email, password);
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }

  @override
  Future<ApiSuccessMessageResponse> resetPassword(String email) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }

  @override
  Future<ApiSuccessMessageResponse> signup(String email, String password) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }
}
