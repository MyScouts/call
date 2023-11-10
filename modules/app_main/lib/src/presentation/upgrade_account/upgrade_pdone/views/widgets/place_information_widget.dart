import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilehub_core/mobilehub_core.dart';
import 'package:ui/ui.dart';

import '../../../../../domain/entities/update_account/place/country.dart';
import '../../../../../domain/entities/update_account/place/district.dart';
import '../../../../../domain/entities/update_account/place/place_information.dart';
import '../../../../../domain/entities/update_account/place/province.dart';
import '../../../../../domain/entities/update_account/place/ward.dart';
import '../../../../../domain/entities/update_account/update_place_information_payload.dart';
import '../../bloc/place_information/place_information_bloc.dart';

class PlaceInformationWidget extends StatefulWidget {
  final ValueChanged<UpdatePlaceInformationPayload> onUpdatePlaceInformation;
  final PlaceInformation? initPlaceInformation;
  final String title;
  final TextEditingController addressCtrl;
  final bool enabled;
  final bool required;
  final bool notRelease;

  const PlaceInformationWidget({
    super.key,
    required this.onUpdatePlaceInformation,
    this.initPlaceInformation,
    required this.title,
    required this.addressCtrl,
    this.enabled = true,
    this.required = true,
    this.notRelease = false,
  });

  @override
  State<PlaceInformationWidget> createState() => _PlaceInformationWidgetState();
}

class _PlaceInformationWidgetState extends State<PlaceInformationWidget>
    with ValidationMixin {
  UpdatePlaceInformationPayload payload = const UpdatePlaceInformationPayload();

  PlaceInformationBloc get bloc => context.read<PlaceInformationBloc>();

  Country? currentCountry;
  Province? currentProvince;
  District? currentDistrict;
  Ward? currentWard;

  final _provinceCtrl = TextEditingController();
  final _districtCtrl = TextEditingController();
  final _wardCtrl = TextEditingController();

  void _listenerBloc(BuildContext context, PlaceInformationState state) {
    final stateCode = currentProvince?.stateCode;
    final iso2 = currentCountry?.iso2;
    final code = currentDistrict?.code;

    if (state is GetListProvincesSuccess && currentDistrict != null) {
      if (stateCode != null && iso2 != null) {
        bloc.add(GetDistrictsByProvinceEvent(iso2, stateCode));
      }
    }
    if (state is GetDistrictsSuccess && currentWard != null) {
      if (stateCode != null && iso2 != null && code != null) {
        bloc.add(GetWardsByDistrictEvent(iso2, stateCode, code));
      }
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.initPlaceInformation != null) {
      currentCountry = widget.initPlaceInformation?.country;
      currentProvince = widget.initPlaceInformation?.province;
      currentDistrict = widget.initPlaceInformation?.district;
      currentWard = widget.initPlaceInformation?.ward;

      if (currentCountry != null) {
        if (currentCountry?.iso2?.isNotEmpty ?? false) {
          bloc.add(GetListProvincesEvent(currentCountry!.iso2!));
        }
      }

      // payload = payload.copyWith(
      //   country: currentCountry?.iso2,
      //   province: currentProvince?.stateCode,
      //   district: currentDistrict?.code,
      //   ward: currentWard?.id,
      // );
    }

    if (widget.addressCtrl.text.isNotEmpty) {
      payload = payload.copyWith(address: widget.addressCtrl.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlaceInformationBloc, PlaceInformationState>(
        listener: _listenerBloc,
        builder: (context, state) {
          final countries = state.countries ?? [];
          var provinces = state.provinces ?? [];
          var districts = state.districts ?? [];
          var wards = state.wards ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  widget.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontSize: 14),
                ),
              ),

              /// Quốc Gia - Tỉnh Thành
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SearchInputInformationWidget<Country>(
                      required: widget.required,
                      enabled: widget.enabled,
                      suggestions: countries
                          .map((e) => SuggestionsField(name: e.name!, data: e))
                          .toList(),
                      type: UpdateInformationType.country,
                      initialValue: currentCountry != null
                          ? SuggestionsField(
                              name: currentCountry?.name ?? '',
                              data: currentCountry!,
                            )
                          : null,
                      onSelected: (value) {
                        if (value != null) {
                          currentCountry = value;
                          currentProvince = null;
                          currentDistrict = null;
                          currentWard = null;
                          provinces = [];
                          districts = [];
                          wards = [];

                          bloc.add(GetListProvincesEvent(value.iso2!));
                          // payload = payload.copyWith(country: value.iso2!);

                          widget.onUpdatePlaceInformation(payload);
                        }
                      },
                      validator: (value) => widget.required && widget.enabled
                          ? validateEmptyInfo(
                              currentCountry?.name,
                              'Vui lòng chọn quốc gia',
                            )
                          : null,
                      onChanged: (val) {
                        if (val != null &&
                            val == (currentCountry?.name ?? '')) {
                          return;
                        }

                        _provinceCtrl.clear();
                        _districtCtrl.clear();
                        _wardCtrl.clear();
                        currentCountry = null;
                        currentProvince = null;
                        currentDistrict = null;
                        currentWard = null;
                        provinces = [];
                        districts = [];
                        wards = [];

                        bloc.add(UserClearCountryEvent());

                        payload = UpdatePlaceInformationPayload(
                            address: widget.addressCtrl.text);

                        widget.onUpdatePlaceInformation(payload);
                      },
                    ),
                  ),
                  _buildSpacer(),
                  Expanded(
                    child: SearchInputInformationWidget<Province>(
                      required: widget.required,
                      enabled: widget.enabled,
                      controller: _provinceCtrl,
                      suggestions: provinces
                          .map((e) => SuggestionsField(name: e.name!, data: e))
                          .toList(),
                      type: UpdateInformationType.province,
                      initialValue: currentProvince != null
                          ? SuggestionsField(
                              name: currentProvince?.name ?? '',
                              data: currentProvince!,
                            )
                          : null,
                      onSelected: (val) {
                        if (val != null) {
                          currentProvince = val;
                          currentDistrict = null;
                          currentWard = null;

                          districts = [];
                          wards = [];

                          bloc.add(
                            GetDistrictsByProvinceEvent(
                                currentCountry!.iso2!, val.stateCode!),
                          );

                          // payload = payload.copyWith(
                          //   province: val.stateCode!,
                          //   district: null,
                          //   ward: null,
                          // );

                          widget.onUpdatePlaceInformation(payload);
                        }
                      },
                      validator: (value) => widget.enabled && widget.required
                          ? validateEmptyInfo(
                              currentProvince?.name,
                              'Vui lòng chọn tỉnh thành',
                            )
                          : null,
                      onChanged: (val) {
                        if (val != null &&
                            val == (currentProvince?.name ?? '')) {
                          return;
                        }

                        if (val != (currentProvince?.name ?? '')) {
                          _districtCtrl.clear();
                          _wardCtrl.clear();
                          currentDistrict = null;
                          currentWard = null;
                          currentProvince = null;
                          districts = [];
                          wards = [];
                        }

                        // payload = payload.copyWith(
                        //   province: null,
                        //   district: null,
                        //   ward: null,
                        // );

                        widget.onUpdatePlaceInformation(payload);
                      },
                    ),
                  ),
                ],
              ),

              /// Quận huyện - Phường xã
              !widget.notRelease
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SearchInputInformationWidget<District>(
                            type: UpdateInformationType.district,
                            enabled: widget.enabled,
                            required: true,
                            suggestions: districts
                                .map((e) =>
                                    SuggestionsField(name: e.name!, data: e))
                                .toList(),
                            initialValue: currentDistrict != null
                                ? SuggestionsField(
                                    name: currentDistrict?.name ?? '',
                                    data: currentDistrict!,
                                  )
                                : null,
                            onSelected: (val) {
                              if (val != null) {
                                currentDistrict = val;
                                currentWard = null;
                                wards = [];

                                bloc.add(
                                  GetWardsByDistrictEvent(currentCountry!.iso2!,
                                      currentProvince!.stateCode!, val.code!),
                                );

                                // payload = payload.copyWith(
                                //   district: currentDistrict?.code,
                                //   ward: null,
                                // );

                                widget.onUpdatePlaceInformation(payload);
                              }
                            },
                            controller: _districtCtrl,
                            onChanged: (val) {
                              if (val != null &&
                                  val == (currentDistrict?.name ?? '')) {
                                return;
                              }

                              if (val != (currentDistrict?.name ?? '')) {
                                _wardCtrl.clear();
                                currentWard = null;
                                currentDistrict = null;
                                wards = [];
                              }

                              // payload =
                              //     payload.copyWith(district: null, ward: null);

                              widget.onUpdatePlaceInformation(payload);
                            },
                          ),
                        ),
                        _buildSpacer(),
                        Expanded(
                          child: SearchInputInformationWidget<Ward>(
                            type: UpdateInformationType.ward,
                            required: true,
                            enabled: widget.enabled,
                            suggestions: wards
                                .map((e) =>
                                    SuggestionsField(name: e.name!, data: e))
                                .toList(),
                            initialValue: currentWard != null
                                ? SuggestionsField(
                                    name: currentWard?.name ?? '',
                                    data: currentWard!,
                                  )
                                : null,
                            onSelected: (val) {
                              if (val != null) {
                                setState(() {
                                  currentWard = val;
                                });

                                // payload =
                                //     payload.copyWith(ward: currentWard?.id);

                                widget.onUpdatePlaceInformation(payload);
                              }
                            },
                            controller: _wardCtrl,
                            onChanged: (val) {
                              if (val != null &&
                                  val == (currentWard?.name ?? '')) {
                                return;
                              }

                              currentWard = null;
                              // payload = payload.copyWith(ward: null);

                              widget.onUpdatePlaceInformation(payload);
                            },
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),

              /// Địa chỉ cụ thể
              !widget.notRelease
                  ? InformationFieldWidget(
                      onChanged: (value) {
                        payload = payload.copyWith(address: value);
                        widget.onUpdatePlaceInformation(payload);
                      },
                      type: UpdateInformationType.address,
                      controller: widget.addressCtrl,
                      shouldEnabled: widget.enabled,
                      required: true,
                    )
                  : const SizedBox(),
            ],
          );
        });
  }

  Widget _buildSpacer() => const SizedBox(width: 10);

  String? validateEmptyInfo(String? value, String messageError) {
    final isNullOrEmpty = value?.isEmpty ?? true;
    if (isNullOrEmpty) {
      return messageError;
    }

    return null;
  }
}
