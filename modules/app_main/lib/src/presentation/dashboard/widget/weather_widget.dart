import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/dashboard/widget/weather_bloc_builder.dart';
import 'package:app_main/src/presentation/dashboard/widget/weather_location_builder.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    this.textColor,
    this.enableEditMode = false,
    this.onRemoved,
  });

  final Color? textColor;
  final bool enableEditMode;
  final VoidCallback? onRemoved;

  @override
  Widget build(BuildContext context) {
    return WeatherLocationBuilder(
      builder: (position, city) {
        Widget child = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Text(
                city ?? 'Hồ Chí Minh',
                style: context.text.titleSmall!.copyWith(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              '-°',
              style: context.text.titleSmall!.copyWith(
                color: AppColors.white,
                fontSize: 52,
                fontWeight: FontWeight.w200,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        );
        if (position != null) {
          child = WeatherBlocBuilder(
            lat: position.latitude,
            lon: position.longitude,
            builder: (state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      city ?? '',
                      style: context.text.titleSmall!.copyWith(
                        color: AppColors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Flexible(
                    child: AutoSizeText(
                      '${state.openWeatherCurrent?.temp ?? 0}°',
                      style: context.text.titleSmall!.copyWith(
                        color: AppColors.white,
                        fontSize: 52,
                        fontWeight: FontWeight.w200,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox.square(
                      dimension: 30,
                      child: ImageWidget(
                        state.openWeatherCurrent?.condition.image ?? '',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    state.openWeatherCurrent?.condition.name.capitalize() ?? '',
                    style: context.text.titleSmall!.copyWith(
                      color: AppColors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'H:${state.openWeatherCurrent?.tempMax ?? 0}° L:${state.openWeatherCurrent?.tempMin ?? 0}°',
                    style: context.text.titleSmall!.copyWith(
                      color: AppColors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
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
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff007AF6),
                          Color(0xff77B1EB),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: child,
                  ),
                  if (enableEditMode)
                    Positioned(
                      left: 0,
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
              'Thời tiết',
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
