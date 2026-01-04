import 'package:bloc/bloc.dart';
import 'package:flutter_template/core/resource/resource.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_template/features/auth/domain/repositories/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const LoginState.initial());

  final AuthRepository _authRepository;

  Future<void> login({required String email, required String password}) async {
    try {
      emit(const LoginState.loading());

      final response = await _authRepository.login(email, password);
      response.when(
        success: (userEntity) {
          emit(LoginState.success(userEntity));
        },
        error: (error) {
          emit(LoginState.error(error.toMessage()));
        },
      );
    } catch (e) {
      emit(LoginState.error("Error loading users: ${e.toString()}"));
    }
  }

  bool get isLoading => state.maybeWhen(loading: () => true, orElse: () => false);
}
