import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_success_message_response.freezed.dart';
part 'api_success_message_response.g.dart';

@freezed
abstract class ApiSuccessMessageResponse with _$ApiSuccessMessageResponse {
  const factory ApiSuccessMessageResponse({required String message}) = _ApiSuccessMessageResponse;

  factory ApiSuccessMessageResponse.fromJson(Map<String, Object?> json) =>
      _$ApiSuccessMessageResponseFromJson(json);
}
