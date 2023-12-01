import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
import 'package:app_main/src/data/models/responses/marshop_response.dart';
import 'package:app_main/src/domain/usecases/marshop_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

typedef GetListMarshopBloc
    = GetListBlocParam1<MarshopInfo, GetListMarshopPayload>;

@module
abstract class MarshopBlocFactory {
  @factory
  GetListMarshopBloc listMarshopBloc(MarshopUsecase usecase) =>
      GetListMarshopBloc(usecase.getMarShops);
}
