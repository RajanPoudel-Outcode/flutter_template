import 'package:flutter_template/core/exceptions/custom_exception.dart';
import 'package:flutter_template/core/resource/resource.dart';
import 'package:flutter_template/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter_template/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_template/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/exception_handler.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Result<UserEntity>> login(String email, String password) async {
    try {
      final response = await remoteDataSource.login(email, password);
      await localDataSource.cacheToken(response.data.accessToken);
      return Result.success(response.data.asEntity());
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }

  @override
  Future<Result<String>> signup(String email, String password) async {
    try {
      final response = await remoteDataSource.signup(email, password);
      return Result.success(response.message);
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }

  @override
  Future<Result<String>> resetPassword(String email) async {
    try {
      final response = await remoteDataSource.resetPassword(email);
      return Result.success(response.message);
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }

  @override
  Future<Result<String>> getCachedToken() async {
    try {
      final response = await localDataSource.getLastToken();
      return Result.success(response ?? '');
    } on CustomException catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
