import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/update_account/place/country.dart';
import '../../../../../domain/entities/update_account/place/district.dart';
import '../../../../../domain/entities/update_account/place/province.dart';
import '../../../../../domain/entities/update_account/place/ward.dart';
import '../../../../../domain/usecases/place_information_usecase.dart';
import '../../../place_information_constant.dart';


part 'place_information_event.dart';
part 'place_information_state.dart';

@injectable
class PlaceInformationBloc
    extends Bloc<PlaceInformationEvent, PlaceInformationState> {
  final PlaceInformationUsecase _placeInformationUsecase;

  PlaceInformationBloc(this._placeInformationUsecase)
      : super(PlaceInformationInitial(countries)) {
    on<GetListProvincesEvent>(_mapGetListProvincesEvent);
    on<GetDistrictsByProvinceEvent>(_mapGetDistrictsByProvinceEvent);
    on<GetWardsByDistrictEvent>(_mapGetWardsByDistrictEvent);
    on<UserClearCountryEvent>(_mapUserClearCountryEvent);
  }

  FutureOr<void> _mapGetListProvincesEvent(
      GetListProvincesEvent event, Emitter<PlaceInformationState> emit) async {
    try {
      final res = await _placeInformationUsecase.provincesOfCountry(event.iso2);

      emit(GetListProvincesSuccess(state.countries!, res));
    } catch (e) {
      // emit(GetListProvincesFailure(e.toString()));
    }
  }

  FutureOr<void> _mapGetDistrictsByProvinceEvent(
      GetDistrictsByProvinceEvent event,
      Emitter<PlaceInformationState> emit) async {
    try {
      final res = await _placeInformationUsecase.districtsByProvince(
        event.iso2,
        event.stateCode,
      );

      emit(GetDistrictsSuccess(state.countries!, state.provinces!, res));
    } catch (e) {
      // emit(GetDistrictsFailure(e.toString()));
    }
  }

  FutureOr<void> _mapGetWardsByDistrictEvent(GetWardsByDistrictEvent event,
      Emitter<PlaceInformationState> emit) async {
    try {
      final res = await _placeInformationUsecase.wardsByDistrict(
          event.iso2, event.stateCode, event.district);

      emit(GetWardsSuccess(
          state.countries!, state.provinces!, state.districts!, res));
    } catch (e) {
      // emit(GetWardsFailure(e.toString()));
    }
  }

  FutureOr<void> _mapUserClearCountryEvent(
      UserClearCountryEvent event, Emitter<PlaceInformationState> emit) {
    emit(PlaceInformationInitial(countries));
  }
}
