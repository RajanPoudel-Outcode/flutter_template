import 'package:injectable/injectable.dart';
import 'package:flutter_template/core/resource/resource.dart';
import 'package:flutter_template/core/exceptions/custom_exception.dart';
import 'package:flutter_template/core/exceptions/exception_handler.dart';
import 'package:flutter_template/features/term_conditions/data/datasources/term_conditions_remote_data_source.dart';
import 'package:flutter_template/features/term_conditions/domain/repositories/term_conditions_repository.dart';
import 'package:flutter_template/features/term_conditions/domain/entities/term_conditions_entity.dart';

@LazySingleton(as: TermConditionsRepository)
class TermConditionsRepositoryImpl extends TermConditionsRepository {
 final TermConditionsRemoteDataSource remoteDataSource;

  TermConditionsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<TermConditionsEntity>> getTermConditions() async {
    try {
      final response = await remoteDataSource.getTermConditions();
      return Result.success(response.data.asEntity());
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }
}
