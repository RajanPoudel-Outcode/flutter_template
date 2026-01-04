import 'package:flutter_template/core/resource/resource.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Result<UserEntity>> login(String email, String password);
  Future<Result<String>> signup(String email, String password);
  Future<Result<String>> resetPassword(String email);
  Future<void> logout();

  Future<Result<String>> getCachedToken();
}
