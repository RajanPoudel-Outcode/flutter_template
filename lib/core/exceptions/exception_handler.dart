import 'dart:io';

import 'package:dio/dio.dart';

import 'custom_exception.dart';

class ExceptionHandler {
  ExceptionHandler._();

  static CustomException handleException(Object obj) {
    if (obj is DioException) {
      return _getException(obj);
    } else if (obj is CustomException) {
      return obj;
    }
    return CustomException.error('Error');
  }

  static CustomException _getException(DioException error) {
    if (error.type == DioExceptionType.unknown) {
      if (error.error is SocketException) {
        return CustomException.noInternetConnection();
      } else {
        return CustomException.error('Something went wrong');
      }
    } else if (error.type == DioExceptionType.badResponse) {
      try {
        if (error.response!.statusCode == 440) {
          return CustomException.sessionExpired();
        } else if (error.response!.statusCode == 400 &&
            error.requestOptions.path.contains('login')) {
          return CustomException.error('Please check your login credentials');
        } else if (error.response!.statusCode == 422 &&
            error.requestOptions.path.contains('forgot-password')) {
          return CustomException.error(
              'If there is any account with such email address, we have sent you a password retreival email. Please check');
        } else {
          // Utilities.printObj(error.response!.data['error_message']);
          return fromJson(error.response!.data);
        }
      } catch (e) {
        return CustomException.error(e.toString());
      }
    } else if (error.type == DioExceptionType.sendTimeout) {
      return CustomException.timeoutExpection();
    } else {
      return CustomException.error(error.message ?? 'Error');
    }
  }

  static CustomException fromJson(Map<String, dynamic> json) {
    final errorMessages = json['error_message'];
    List<String> messages;
    if (errorMessages is String) {
      messages = [errorMessages];
    } else if (errorMessages is List) {
      messages = List<String>.from(errorMessages);
    } else {
      messages = [];
    }

    return CustomException.error(messages.join('\n'));
  }
}
