import 'package:injectable/injectable.dart';
import 'package:flutter_template/core/clients/rest_client/authorized_api_client/authorized_api_client.dart';
import 'package:flutter_template/core/exceptions/exception_handler.dart';
import 'package:flutter_template/core/models/response_wrapper.dart';

import 'package:flutter_template/features/term_conditions/data/models/term_conditions_model.dart';

abstract class TermConditionsRemoteDataSource {
    Future<ResponseWrapper<TermConditionsModel>> getTermConditions();
 }
  
 @LazySingleton(as: TermConditionsRemoteDataSource)
 class TermConditionsRemoteDataSourceImpl extends TermConditionsRemoteDataSource {
  final AuthorizedApiClient authorizedApiClient;

  TermConditionsRemoteDataSourceImpl(this.authorizedApiClient);

  @override
  Future<ResponseWrapper<TermConditionsModel>> getTermConditions() async {
    try {
     throw UnimplementedError();
    //  return await authorizedApiClient.getTermConditions();
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }
}
