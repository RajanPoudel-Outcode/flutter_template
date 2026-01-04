import 'package:flutter_template/core/entity/refresh_token_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token_model.freezed.dart';
part 'refresh_token_model.g.dart';

@freezed
abstract class RefreshTokenModel with _$RefreshTokenModel {
  const factory RefreshTokenModel({@JsonKey(name: 'jwt') required String accessToken}) =
      _RefreshTokenModel;

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenModelFromJson(json);

  const RefreshTokenModel._();

  RefreshTokenEntity asEntity() => RefreshTokenEntity(accessToken: accessToken);
}
