import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
import 'package:app_main/src/data/models/responses/ecom/product_detail_response.dart';
import 'package:app_main/src/data/models/responses/marshop_response.dart';
import 'package:app_main/src/domain/usecases/marshop_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

typedef GetListMarshopBloc
    = GetListBlocParam1<MarshopResponse, GetListMarshopPayload>;

typedef MarshopDetailBloc
    = GetDetailBlocParam1<MarshopResponse, GetMarshopInfoPayload>;

typedef ListProductBloc
    = GetDetailBlocParam1<ProductDetailResponse, List<String>>;

typedef ListMarshopRegisterPackBloc = GetListBloc<MarshopRegisterPackResponse>;

@module
abstract class MarshopBlocFactory {
  @factory
  GetListMarshopBloc listMarshopBloc(MarshopUsecase usecase) =>
      GetListMarshopBloc(usecase.getMarShops);

  @factory
  MarshopDetailBloc getMarshopInfo(MarshopUsecase usecase) =>
      MarshopDetailBloc(usecase.getMarShop);

  @factory
  ListMarshopRegisterPackBloc getMarshopPack(MarshopUsecase usecase) =>
      ListMarshopRegisterPackBloc(usecase.getRegisterPacks);

  @factory
  ListProductBloc getProducts(MarshopUsecase usecase) =>
      ListMarshopRegisterPackBloc(usecase.getRegisterPacks);
}
