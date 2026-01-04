// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomException {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomException()';
}


}

/// @nodoc
class $CustomExceptionCopyWith<$Res>  {
$CustomExceptionCopyWith(CustomException _, $Res Function(CustomException) __);
}


/// Adds pattern-matching-related methods to [CustomException].
extension CustomExceptionPatterns on CustomException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NoRecordsException value)?  noRecords,TResult Function( ErrorException value)?  error,TResult Function( FailedToParseException value)?  failedToParse,TResult Function( SessionExpiredException value)?  sessionExpired,TResult Function( NoInternetConnectionException value)?  noInternetConnection,TResult Function( TimeoutException value)?  timeoutExpection,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NoRecordsException() when noRecords != null:
return noRecords(_that);case ErrorException() when error != null:
return error(_that);case FailedToParseException() when failedToParse != null:
return failedToParse(_that);case SessionExpiredException() when sessionExpired != null:
return sessionExpired(_that);case NoInternetConnectionException() when noInternetConnection != null:
return noInternetConnection(_that);case TimeoutException() when timeoutExpection != null:
return timeoutExpection(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NoRecordsException value)  noRecords,required TResult Function( ErrorException value)  error,required TResult Function( FailedToParseException value)  failedToParse,required TResult Function( SessionExpiredException value)  sessionExpired,required TResult Function( NoInternetConnectionException value)  noInternetConnection,required TResult Function( TimeoutException value)  timeoutExpection,}){
final _that = this;
switch (_that) {
case NoRecordsException():
return noRecords(_that);case ErrorException():
return error(_that);case FailedToParseException():
return failedToParse(_that);case SessionExpiredException():
return sessionExpired(_that);case NoInternetConnectionException():
return noInternetConnection(_that);case TimeoutException():
return timeoutExpection(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NoRecordsException value)?  noRecords,TResult? Function( ErrorException value)?  error,TResult? Function( FailedToParseException value)?  failedToParse,TResult? Function( SessionExpiredException value)?  sessionExpired,TResult? Function( NoInternetConnectionException value)?  noInternetConnection,TResult? Function( TimeoutException value)?  timeoutExpection,}){
final _that = this;
switch (_that) {
case NoRecordsException() when noRecords != null:
return noRecords(_that);case ErrorException() when error != null:
return error(_that);case FailedToParseException() when failedToParse != null:
return failedToParse(_that);case SessionExpiredException() when sessionExpired != null:
return sessionExpired(_that);case NoInternetConnectionException() when noInternetConnection != null:
return noInternetConnection(_that);case TimeoutException() when timeoutExpection != null:
return timeoutExpection(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  noRecords,TResult Function( String message)?  error,TResult Function()?  failedToParse,TResult Function()?  sessionExpired,TResult Function()?  noInternetConnection,TResult Function()?  timeoutExpection,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NoRecordsException() when noRecords != null:
return noRecords();case ErrorException() when error != null:
return error(_that.message);case FailedToParseException() when failedToParse != null:
return failedToParse();case SessionExpiredException() when sessionExpired != null:
return sessionExpired();case NoInternetConnectionException() when noInternetConnection != null:
return noInternetConnection();case TimeoutException() when timeoutExpection != null:
return timeoutExpection();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  noRecords,required TResult Function( String message)  error,required TResult Function()  failedToParse,required TResult Function()  sessionExpired,required TResult Function()  noInternetConnection,required TResult Function()  timeoutExpection,}) {final _that = this;
switch (_that) {
case NoRecordsException():
return noRecords();case ErrorException():
return error(_that.message);case FailedToParseException():
return failedToParse();case SessionExpiredException():
return sessionExpired();case NoInternetConnectionException():
return noInternetConnection();case TimeoutException():
return timeoutExpection();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  noRecords,TResult? Function( String message)?  error,TResult? Function()?  failedToParse,TResult? Function()?  sessionExpired,TResult? Function()?  noInternetConnection,TResult? Function()?  timeoutExpection,}) {final _that = this;
switch (_that) {
case NoRecordsException() when noRecords != null:
return noRecords();case ErrorException() when error != null:
return error(_that.message);case FailedToParseException() when failedToParse != null:
return failedToParse();case SessionExpiredException() when sessionExpired != null:
return sessionExpired();case NoInternetConnectionException() when noInternetConnection != null:
return noInternetConnection();case TimeoutException() when timeoutExpection != null:
return timeoutExpection();case _:
  return null;

}
}

}

/// @nodoc


class NoRecordsException extends CustomException {
   NoRecordsException(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoRecordsException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomException.noRecords()';
}


}




/// @nodoc


class ErrorException extends CustomException {
   ErrorException(this.message): super._();
  

 final  String message;

/// Create a copy of CustomException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorExceptionCopyWith<ErrorException> get copyWith => _$ErrorExceptionCopyWithImpl<ErrorException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CustomException.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorExceptionCopyWith<$Res> implements $CustomExceptionCopyWith<$Res> {
  factory $ErrorExceptionCopyWith(ErrorException value, $Res Function(ErrorException) _then) = _$ErrorExceptionCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorExceptionCopyWithImpl<$Res>
    implements $ErrorExceptionCopyWith<$Res> {
  _$ErrorExceptionCopyWithImpl(this._self, this._then);

  final ErrorException _self;
  final $Res Function(ErrorException) _then;

/// Create a copy of CustomException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorException(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FailedToParseException extends CustomException {
   FailedToParseException(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailedToParseException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomException.failedToParse()';
}


}




/// @nodoc


class SessionExpiredException extends CustomException {
   SessionExpiredException(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionExpiredException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomException.sessionExpired()';
}


}




/// @nodoc


class NoInternetConnectionException extends CustomException {
   NoInternetConnectionException(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoInternetConnectionException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomException.noInternetConnection()';
}


}




/// @nodoc


class TimeoutException extends CustomException {
   TimeoutException(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeoutException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomException.timeoutExpection()';
}


}




// dart format on
