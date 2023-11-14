import 'dart:async';

import 'package:app_main/src/domain/entities/update_account/place/country.dart';
import 'package:app_main/src/domain/entities/update_account/place/district.dart';
import 'package:app_main/src/domain/entities/update_account/place/province.dart';
import 'package:app_main/src/domain/entities/update_account/place/ward.dart';
import 'package:app_main/src/domain/usecases/place_information_usecase.dart';
import 'package:app_main/src/presentation/upgrade_account/place_information_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'place_information_2_event.dart';

part 'place_information_2_state.dart';

@injectable
class PlaceInformationBloc2 extends Bloc<PlaceInformationEvent2, PlaceInformationState2> {
  final PlaceInformationUsecase _placeInformationUsecase;

  PlaceInformationBloc2(this._placeInformationUsecase) : super(PlaceInformationInitial2(countries)) {
    on<GetListProvincesEvent2>(_mapGetListProvincesEvent);
    on<GetDistrictsByProvinceEvent2>(_mapGetDistrictsByProvinceEvent);
    on<GetWardsByDistrictEvent2>(_mapGetWardsByDistrictEvent);
    on<UserClearCountryEvent2>(_mapUserClearCountryEvent);
  }

  FutureOr<void> _mapGetListProvincesEvent(GetListProvincesEvent2 event, Emitter<PlaceInformationState2> emit) async {
    try {
      final res = await _placeInformationUsecase.provincesOfCountry(event.iso2);

      emit(GetListProvincesSuccess2(state.countries!, res));
    } catch (e) {
      // emit(GetListProvincesFailure(e.toString()));
    }
  }

  FutureOr<void> _mapGetDistrictsByProvinceEvent(
      GetDistrictsByProvinceEvent2 event, Emitter<PlaceInformationState2> emit) async {
    try {
      final res = await _placeInformationUsecase.districtsByProvince(
        event.iso2,
        event.stateCode,
      );

      emit(GetDistrictsSuccess2(state.countries!, state.provinces!, res));
    } catch (e) {
      // emit(GetDistrictsFailure(e.toString()));
    }
  }

  FutureOr<void> _mapGetWardsByDistrictEvent(
      GetWardsByDistrictEvent2 event, Emitter<PlaceInformationState2> emit) async {
    try {
      final res = await _placeInformationUsecase.wardsByDistrict(event.iso2, event.stateCode, event.district);

      emit(GetWardsSuccess2(state.countries!, state.provinces!, state.districts!, res));
    } catch (e) {
      // emit(GetWardsFailure(e.toString()));
    }
  }

  FutureOr<void> _mapUserClearCountryEvent(UserClearCountryEvent2 event, Emitter<PlaceInformationState2> emit) async {
    final resCountries = await _placeInformationUsecase.countries();
    emit(PlaceInformationInitial2(resCountries));
  }
}
