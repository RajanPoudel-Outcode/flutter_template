// import 'dart:async';

// import 'package:dio/dio.dart';



// class RefreshTokenInterceptor extends Interceptor {
//   RefreshTokenInterceptor({
//     required AuthRemoteDataSource remoteDataSource,
//     required AuthLocalDataSource localDataSource,
//   })  : _authRemoteDataSource = remoteDataSource,
//         _authLocalDataSource = localDataSource;

//   final AuthRemoteDataSource _authRemoteDataSource;
//   final AuthLocalDataSource _authLocalDataSource;

//   bool _isRefreshingToken = false;
//   Completer<bool>? _refreshCompleter;

//   @override
//   Future<void> onError(
//       DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       final cancelToken = CancelToken(); // Create a cancel token

//       if (!_isRefreshingToken) {
//         // If no refresh is in progress, start one
//         _isRefreshingToken = true;
//         _refreshCompleter = Completer<bool>();

//         final tokenRefreshed = await _refreshAccessToken(cancelToken);

//         // Complete the completer
//         _refreshCompleter!.complete(tokenRefreshed);
//         _isRefreshingToken = false;
//       }

//       // Wait for the refresh process to complete
//       final tokenRefreshed = await _refreshCompleter!.future;

//       if (tokenRefreshed) {
//         try {
//           // Retry the failed request with the original requestOptions and pass the CancelToken
//           final response = await _retry(err.requestOptions, cancelToken);
//           handler.resolve(response);
//           return;
//         } catch (e) {
//           // If retry fails, log or handle error here
//           handler
//               .next(DioException(requestOptions: err.requestOptions, error: e));
//         }
//       } else {
//         // If token refresh failed, trigger session expiration
//         Injector.instance<AuthenticationBloc>().add(SessionExpiredEvent());
//       }
//     }

//     handler.next(err);
//   }

//   Future<Response<dynamic>> _retry(
//       RequestOptions requestOptions, CancelToken? cancelToken) async {
//     final options =
//         Options(method: requestOptions.method, headers: requestOptions.headers);
//     final dio = Injector.instance.get<Dio>(instanceName: 'authorizedInstance');
//     return dio.request<dynamic>(
//       requestOptions.path,
//       data: requestOptions.data,
//       queryParameters: requestOptions.queryParameters,
//       options: options,
//       cancelToken: cancelToken,
//     );
//   }

//   Future<bool> _refreshAccessToken(CancelToken? cancelToken) async {
//     try {
//       final refreshTokenEntity = await _authLocalDataSource.getLastToken();
//       final refreshResponse = await _authRemoteDataSource.refreshToken(
//         refreshTokenEntity.refreshToken,
//         'refresh_token',
//         'app email openid',
//         cancelToken,
//       );
//       final tokenEntity = refreshResponse.asEntity();
//       await _authLocalDataSource.cacheToken(tokenEntity);
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
// }
