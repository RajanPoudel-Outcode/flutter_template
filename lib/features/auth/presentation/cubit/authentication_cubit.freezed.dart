// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthenticationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationState()';
}


}

/// @nodoc
class $AuthenticationStateCopyWith<$Res>  {
$AuthenticationStateCopyWith(AuthenticationState _, $Res Function(AuthenticationState) __);
}


/// Adds pattern-matching-related methods to [AuthenticationState].
extension AuthenticationStatePatterns on AuthenticationState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthenticationIdleState value)?  idle,TResult Function( AuthenticationTokenExistState value)?  tokenExist,TResult Function( AuthenticationAuthenticatedState value)?  authenticated,TResult Function( AuthenticationUnauthenticatedState value)?  unauthenticated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthenticationIdleState() when idle != null:
return idle(_that);case AuthenticationTokenExistState() when tokenExist != null:
return tokenExist(_that);case AuthenticationAuthenticatedState() when authenticated != null:
return authenticated(_that);case AuthenticationUnauthenticatedState() when unauthenticated != null:
return unauthenticated(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthenticationIdleState value)  idle,required TResult Function( AuthenticationTokenExistState value)  tokenExist,required TResult Function( AuthenticationAuthenticatedState value)  authenticated,required TResult Function( AuthenticationUnauthenticatedState value)  unauthenticated,}){
final _that = this;
switch (_that) {
case AuthenticationIdleState():
return idle(_that);case AuthenticationTokenExistState():
return tokenExist(_that);case AuthenticationAuthenticatedState():
return authenticated(_that);case AuthenticationUnauthenticatedState():
return unauthenticated(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthenticationIdleState value)?  idle,TResult? Function( AuthenticationTokenExistState value)?  tokenExist,TResult? Function( AuthenticationAuthenticatedState value)?  authenticated,TResult? Function( AuthenticationUnauthenticatedState value)?  unauthenticated,}){
final _that = this;
switch (_that) {
case AuthenticationIdleState() when idle != null:
return idle(_that);case AuthenticationTokenExistState() when tokenExist != null:
return tokenExist(_that);case AuthenticationAuthenticatedState() when authenticated != null:
return authenticated(_that);case AuthenticationUnauthenticatedState() when unauthenticated != null:
return unauthenticated(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  tokenExist,TResult Function()?  authenticated,TResult Function()?  unauthenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthenticationIdleState() when idle != null:
return idle();case AuthenticationTokenExistState() when tokenExist != null:
return tokenExist();case AuthenticationAuthenticatedState() when authenticated != null:
return authenticated();case AuthenticationUnauthenticatedState() when unauthenticated != null:
return unauthenticated();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  tokenExist,required TResult Function()  authenticated,required TResult Function()  unauthenticated,}) {final _that = this;
switch (_that) {
case AuthenticationIdleState():
return idle();case AuthenticationTokenExistState():
return tokenExist();case AuthenticationAuthenticatedState():
return authenticated();case AuthenticationUnauthenticatedState():
return unauthenticated();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  tokenExist,TResult? Function()?  authenticated,TResult? Function()?  unauthenticated,}) {final _that = this;
switch (_that) {
case AuthenticationIdleState() when idle != null:
return idle();case AuthenticationTokenExistState() when tokenExist != null:
return tokenExist();case AuthenticationAuthenticatedState() when authenticated != null:
return authenticated();case AuthenticationUnauthenticatedState() when unauthenticated != null:
return unauthenticated();case _:
  return null;

}
}

}

/// @nodoc


class AuthenticationIdleState implements AuthenticationState {
  const AuthenticationIdleState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationIdleState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationState.idle()';
}


}




/// @nodoc


class AuthenticationTokenExistState implements AuthenticationState {
  const AuthenticationTokenExistState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationTokenExistState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationState.tokenExist()';
}


}




/// @nodoc


class AuthenticationAuthenticatedState implements AuthenticationState {
  const AuthenticationAuthenticatedState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationAuthenticatedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationState.authenticated()';
}


}




/// @nodoc


class AuthenticationUnauthenticatedState implements AuthenticationState {
  const AuthenticationUnauthenticatedState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationUnauthenticatedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationState.unauthenticated()';
}


}




// dart format on
