import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class AppWidget extends StatelessWidget {
  final DashBoardItem app;

  const AppWidget({
    super.key,
    required this.app,
    this.textColor,
  });
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (app.path != null) {
                  Navigator.of(context).pushNamed(app.path!);
                  return;
                }
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // if (isLongPress != null)
                  //   ValueListenableBuilder(
                  //     valueListenable: isLongPress!,
                  //     builder: (context, value, child) {
                  //       if (value) {
                  //         return Positioned(
                  //           left: 0,
                  //           top: 0,
                  //           child: Container(
                  //             child: Icon(Icons.remove),
                  //           ),
                  //         );
                  //       } else {
                  //         return const SizedBox.shrink();
                  //       }
                  //     },
                  //   ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: AspectRatio(
                      aspectRatio: (app.width) / app.height,
                      child: ImageWidget(
                        app.backgroundImage,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (app.title.isNotEmpty) const SizedBox(height: 5),
          if (app.title.isNotEmpty)
            Text(
              app.title,
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
      ),
    );
  }
}
