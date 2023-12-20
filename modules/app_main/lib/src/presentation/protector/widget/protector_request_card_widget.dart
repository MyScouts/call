import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/protector_request.dart';
import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class RequestCardWidget extends StatelessWidget {
  const RequestCardWidget({
    super.key,
    required this.request,
    required this.onReply,
  });

  final ProtectorRequest request;
  final Function(bool value) onReply;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleNetworkImage(
          url: request.user.avatar ?? '',
          size: 60,
          defaultImage: ImageWidget(ImageConstants.defaultAvatar),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                request.user.getDisplayName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'ID: ${request.user.pDoneId ?? ''}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  color: Color(0xffACACAC),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => onReply.call(false),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xffF4F4F4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: AutoSizeText(
                        'Từ chối',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff6E6E6E),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () => onReply.call(true),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff4B84F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: AutoSizeText(
                        'Đồng ý',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
