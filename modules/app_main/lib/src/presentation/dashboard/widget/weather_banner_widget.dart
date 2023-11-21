import 'package:app_main/src/presentation/dashboard/widget/weather_bloc_builder.dart';
import 'package:app_main/src/presentation/dashboard/widget/weather_location_builder.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:intl/intl.dart';

import 'calendar_builder.dart';

class WeatherBannerWidget extends StatelessWidget {
  const WeatherBannerWidget({
    super.key,
    this.textColor,
    this.enableEditMode = false,
    this.onRemoved,
  });

  final Color? textColor;
  final bool enableEditMode;
  final Function()? onRemoved;

  @override
  Widget build(BuildContext context) {
    return WeatherLocationBuilder(
      builder: (position, city) {
        Widget child = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 65,
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    const CalendarWidget(),
                    VerticalDivider(
                      thickness: 1,
                      width: 30,
                      color: const Color(0xff57AAFF).withOpacity(0.5),
                      indent: 15,
                      endIndent: 15,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          city ?? 'Hồ Chí Minh',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                            color: Color(0xff7A3EF9),
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              '0°',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w300,
                                height: 1.2,
                                color: Color(0xff5686DF),
                              ),
                            ),
                            SizedBox.square(
                              dimension: 23,
                              child: ImageWidget(
                                IconAppConstants.icSun,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                '0°',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  color: Color(0xff5686DF),
                                ),
                              ),
                              ImageWidget(IconAppConstants.icHumidity),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                '0% ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  height: 1.2,
                                  color: Color(0xff5686DF),
                                ),
                              ),
                              ImageWidget(IconAppConstants.icHumidity),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                '0 mph',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  height: 1.2,
                                  color: Color(0xff5686DF),
                                ),
                              ),
                              ImageWidget(IconAppConstants.icWindy),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                '0 mb',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  height: 1.2,
                                  color: Color(0xff5686DF),
                                ),
                              ),
                              ImageWidget(IconAppConstants.icArrowTop),
                              ImageWidget(IconAppConstants.icCircleArrow),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 60,
              child: SizedBox(),
            )
          ],
        );
        if (position != null) {
          child = WeatherBlocBuilder(
            lat: position.latitude,
            lon: position.longitude,
            builder: (state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 65,
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          const CalendarWidget(),
                          VerticalDivider(
                            thickness: 1,
                            width: 30,
                            color: const Color(0xff57AAFF).withOpacity(0.5),
                            indent: 15,
                            endIndent: 15,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                city ?? 'Hồ Chí Minh',
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2,
                                  color: Color(0xff7A3EF9),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${state.openWeatherCurrent?.temp ?? 0}°',
                                    style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                      height: 1.2,
                                      color: Color(0xff5686DF),
                                    ),
                                  ),
                                  SizedBox.square(
                                    dimension: 40,
                                    child: ImageWidget(
                                      state.openWeatherCurrent?.condition
                                              .image ??
                                          '',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${state.openWeatherCurrent?.tempMax ?? 0}°',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2,
                                        color: Color(0xff5686DF),
                                      ),
                                    ),
                                    ImageWidget(IconAppConstants.icHumidity),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${state.openWeatherCurrent?.humidity ?? 0}% ',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        height: 1.2,
                                        color: Color(0xff5686DF),
                                      ),
                                    ),
                                    ImageWidget(IconAppConstants.icHumidity),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${state.openWeatherCurrent?.speed ?? 0} mph',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        height: 1.2,
                                        color: Color(0xff5686DF),
                                      ),
                                    ),
                                    ImageWidget(IconAppConstants.icWindy),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${state.openWeatherCurrent?.pressure ?? 0} mb',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        height: 1.2,
                                        color: Color(0xff5686DF),
                                      ),
                                    ),
                                    ImageWidget(IconAppConstants.icArrowTop),
                                    ImageWidget(IconAppConstants.icCircleArrow),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    flex: 60,
                    child: Row(
                      children: state.weatherDays
                          .map(
                            (e) => Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    '${e.tempMax}°',
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2,
                                      color: Color(0xff5686DF),
                                    ),
                                  ),
                                  Expanded(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: SizedBox.square(
                                        dimension: 30,
                                        child: ImageWidget(e.condition.image),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    DateFormat('EEEE').format(e.time),
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2,
                                      color: Color(0xff5686DF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              );
            },
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.0),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    padding: const EdgeInsets.all(16.0),
                    child: child,
                  ),
                  if (enableEditMode)
                    Positioned(
                      left: -5,
                      top: -10,
                      child: GestureDetector(
                        onTap: onRemoved,
                        behavior: HitTestBehavior.opaque,
                        child: const SizedBox.square(
                          dimension: 25,
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 15,
                              child: Icon(
                                Icons.remove,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Thời gian và thời tiết',
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: context.text.titleSmall!.copyWith(
                color: textColor ?? AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        );
      },
    );
  }
}

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarBuilder(
      builder: (time) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              DateFormat('EEEE').format(time),
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                height: 1.2,
                color: Color(0xff7A3EF9),
              ),
            ),
            Text(
              DateFormat('dd').format(time),
              style: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w300,
                height: 1.2,
                color: Colors.black,
              ),
            ),
          ],
        );
      },
    );
  }
}
