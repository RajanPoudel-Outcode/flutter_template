import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'authorized_api_client.g.dart';

@RestApi()
abstract class AuthorizedApiClient {
  factory AuthorizedApiClient(Dio dio, {String baseUrl}) = _AuthorizedApiClient;

  @GET('users/{id}/')
  Future<String> fetchOnboardingDetails(@Path('id') String id);

  // @GET('users/')
  // Future<ResponseWrapper<AboutUsModel>> getAboutUs();

  // @GET('users/')
  // Future<ResponseWrapper<PrivacyModel>> getPrivacy();
}
