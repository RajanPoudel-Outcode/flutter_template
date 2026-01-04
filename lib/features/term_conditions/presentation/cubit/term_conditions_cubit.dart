import 'package:flutter_template/core/resource/resource.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_template/features/term_conditions/domain/entities/term_conditions_entity.dart';
import 'package:flutter_template/features/term_conditions/domain/repositories/term_conditions_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'term_conditions_cubit.freezed.dart';
part 'term_conditions_state.dart';


@injectable
class TermConditionsCubit extends Cubit<TermConditionsState> {
  TermConditionsCubit(
      {required TermConditionsRepository termConditionsRepository})
      : _termConditionsRepository = termConditionsRepository,
        super(const TermConditionsState.initial());

  final TermConditionsRepository _termConditionsRepository;

  Future<void> fetchTermConditionsData(
      {bool isRefresh = false}) async {
    try {
      if (!isRefresh) {
        emit(const TermConditionsState.loading());
      }
      final response =
          await _termConditionsRepository.getTermConditions();
      response.when(
        success: (data) => emit(TermConditionsState.success(data)),
        error: (error) => emit(TermConditionsState.error(error.toMessage())),
      );
      
    } catch (e) {
        emit(TermConditionsState.error("Error loading users: ${e.toString()}"));
    }
  }
}

