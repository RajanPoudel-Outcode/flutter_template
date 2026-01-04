// import 'package:dio/dio.dart';
// import 'package:outcode_template/core/utils/utilities.dart';


// class BearerTokenInterceptor extends Interceptor {
//   BearerTokenInterceptor({required AuthLocalDataSource localDataSource})
//       : _authLocalDataSource = localDataSource;

//   final AuthLocalDataSource _authLocalDataSource;

//   @override
//   Future<void> onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     try {
//       final bearerToken = await _authLocalDataSource.getLastToken();
//       options.headers['Authorization'] = 'Bearer ${bearerToken.token}';
//       handler.next(options);
//     } catch (e) {
//       Utilities.printObj(e);
//     }
//   }
// }
