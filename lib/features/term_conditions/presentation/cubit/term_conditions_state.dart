part of 'term_conditions_cubit.dart';

@freezed
class TermConditionsState with _$TermConditionsState {
  const factory TermConditionsState.initial() = _Initial;
  const factory TermConditionsState.loading() = _Loading;

  const factory TermConditionsState.success(TermConditionsEntity termConditionsEntity) = _Success;

  const factory TermConditionsState.error(String error) = _Error;
}
