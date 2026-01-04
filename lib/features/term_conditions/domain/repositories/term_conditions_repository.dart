import 'package:flutter_template/core/resource/resource.dart';
import 'package:flutter_template/features/term_conditions/domain/entities/term_conditions_entity.dart';


abstract class TermConditionsRepository {
  Future<Result<TermConditionsEntity>> getTermConditions();
}
