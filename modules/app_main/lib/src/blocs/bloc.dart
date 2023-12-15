import 'package:app_main/src/data/models/responses/resource_response.dart';
import 'package:app_main/src/domain/usecases/resource_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

typedef GetGlobalSettingBloc
    = GetDetailBlocParam1<GlobalSettingResponse, String>;

@module
abstract class BlocModule {
  @factory
  GetGlobalSettingBloc getGlobalBloc(ResourceUsecase usecase) =>
      GetGlobalSettingBloc(usecase.getGlobalConfig);
}
