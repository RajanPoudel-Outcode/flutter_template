part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.idle() = AuthenticationIdleState;
  const factory AuthenticationState.tokenExist() = AuthenticationTokenExistState;
  const factory AuthenticationState.authenticated() = AuthenticationAuthenticatedState;
  const factory AuthenticationState.unauthenticated() = AuthenticationUnauthenticatedState;
}
