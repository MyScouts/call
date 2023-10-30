import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_contants.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';

class StatusBarWidget extends StatefulWidget {
  const StatusBarWidget({super.key});

  @override
  State<StatusBarWidget> createState() => _StatusBarWidgetState();
}

class _StatusBarWidgetState extends State<StatusBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 35),
      padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                height: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    ImageWidget(
                      IconAppConstants.icSearch,
                      color: Colors.white,
                    ),
                    Text(
                      "${S.current.search.capitalize()}...",
                      style: context.text.bodyMedium!.copyWith(
                        color: Colors.white.withOpacity(.8),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.zero,
                icon: ImageWidget(
                  IconAppConstants.icHamburger,
                ),
                onPressed: _showStoreWidgets,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showStoreWidgets() {
    final List<AppItem> widgets = [
      AppItem(
        imageUrl: ImageConstants.bgFacebook,
        title: "Facebook",
      ),
      AppItem(
        imageUrl: ImageConstants.bgInstagram,
        title: "Instagram",
      ),
      AppItem(
        imageUrl: ImageConstants.bgLocket,
        title: "Locket",
      ),
      AppItem(
        imageUrl: ImageConstants.bgTiktok,
        title: "Tiktok",
      ),
      AppItem(
        imageUrl: ImageConstants.bgFacebook,
        title: "Facebook",
      ),
      AppItem(
        imageUrl: ImageConstants.bgInstagram,
        title: "Instagram",
      ),
      AppItem(
        imageUrl: ImageConstants.bgLocket,
        title: "Locket",
      ),
      AppItem(
        imageUrl: ImageConstants.bgTiktok,
        title: "Tiktok",
      ),
    ];

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container();
      },
    );
  }
}
