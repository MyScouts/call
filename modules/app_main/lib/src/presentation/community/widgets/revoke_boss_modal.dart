import 'package:app_core/app_core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class RevokeBossModal extends StatelessWidget {
  final VoidCallback onAction;
  final User member;
  final Team team;

  const RevokeBossModal({
    super.key,
    required this.member,
    required this.onAction,
    required this.team,
  });

  @override
  Widget build(BuildContext context) {
    return DialogContainerWidget(
      marginContent: const EdgeInsets.symmetric(horizontal: 30),
      paddingContent: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                height: 60,
                width: 60,
                imageUrl: member.avatar ?? "",
                errorWidget: (context, url, error) => ImageWidget(
                  ImageConstants.defaultUserAvatar,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.getdisplayName,
                  style: context.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "ID: ${member.pDoneId}",
                  style: context.textTheme.titleSmall!.copyWith(
                    color: const Color(0xFFACACAC),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
              ],
            )
          ]),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              text: "Bạn có muốn huỷ quyền làm Boss Team của Team ",
              style: context.textTheme.titleMedium!.copyWith(
                color: const Color(0xFF667385),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 24 / 16,
              ),
              children: [
                TextSpan(
                  text: team.name,
                  style: context.textTheme.titleMedium!.copyWith(
                    color: const Color(0xFF667385),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 24 / 16,
                  ),
                ),
                const TextSpan(text: " không?"),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Huỷ",
                  style: context.textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => onAction.call(),
                child: Text(
                  "Huỷ quyền",
                  style: context.textTheme.titleMedium!.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
