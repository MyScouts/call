import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

typedef GetUserByIdBloc = GetDetailBlocParam1<User?, int>;

@module
abstract class DiaryBlocFactory {
  @factory
  GetUserByIdBloc getUserDetailBloc(UserUsecase usecase) =>
      GetUserByIdBloc(usecase.geSynctUserById);
}