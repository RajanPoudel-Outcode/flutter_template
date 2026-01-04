import 'package:bloc/bloc.dart';
import 'package:flutter_template/core/injection/injection.dart';
import 'package:flutter_template/core/resource/resource.dart';
import 'package:flutter_template/core/utils/extensions/ui_extension.dart';
import 'package:flutter_template/features/auth/domain/repositories/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'authentication_cubit.freezed.dart';
part 'authentication_state.dart';

@lazySingleton
class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({
    required AuthRepository authRepository,
    // required ProfileRepository profileRepository,
  }) : _authRepository = authRepository,
       //  _profileRepository = profileRepository,
       super(const AuthenticationState.idle()) {
    checkUserSession();
  }

  final AuthRepository _authRepository;
  // final ProfileRepository _profileRepository;

  /// Check user session on app start
  Future<void> checkUserSession() async {
    final result = await _authRepository.getCachedToken();
    await Future.delayed(const Duration(seconds: 2));

    result.whenOrNull(
      success: (token) {
        if (token.isNullOrEmpty) {
          emit(const AuthenticationState.unauthenticated());
        } else {
          emit(const AuthenticationState.authenticated());
        }
      },
      error: (_) {
        emit(const AuthenticationState.unauthenticated());
      },
    );
  }

  /// Update authentication status manually
  void updateAuthenticationStatus(bool status) {
    if (status) {
      emit(const AuthenticationState.authenticated());
    } else {
      emit(const AuthenticationState.unauthenticated());
    }
  }

  /// Fetch user information
  // Future<void> fetchUserInformation() async {
  //   final response = await _profileRepository.getUserProfile();
  //   response.when(
  //     success: (user) => emit(const AuthenticationState.authenticated()),
  //     error: (_) => emit(const AuthenticationState.unauthenticated()),
  //   );
  // }

  /// Handle session expiration
  Future<void> sessionExpired() async {
    await _evictUser();
  }

  Future<void> _evictUser() async {
    // await _authRepository.logout();
    getIt<AuthenticationCubit>().updateAuthenticationStatus(false);
  }
}
