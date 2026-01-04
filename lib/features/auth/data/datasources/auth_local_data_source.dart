import 'dart:developer';

import 'package:flutter_template/core/services/local_storage_service/local_storage_service.dart';
import 'package:injectable/injectable.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheToken(String token);
  Future<String?> getLastToken();
  Future<void> clearToken();
  Future<void> clearLocalCache();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final LocalStorageService _localStorageService;

  AuthLocalDataSourceImpl(this._localStorageService);

  @override
  Future<void> cacheToken(String token) async {
    log('Caching token: $token');
    final previousToken = await _localStorageService.accessToken;
    log('Previous token: $previousToken');

    await _localStorageService.setAccessToken(token);
  }

  @override
  Future<void> clearToken() async {
    await _localStorageService.setAccessToken(null);
  }

  @override
  Future<void> clearLocalCache() async {
    return await _localStorageService.clearLocalCache();
  }

  @override
  Future<String?> getLastToken() async {
    final token = await _localStorageService.accessToken;
    // if (token == null) {
    //   throw CustomException.noRecords();
    // }
    // log('Current token: $token');

    return token;
  }
}
