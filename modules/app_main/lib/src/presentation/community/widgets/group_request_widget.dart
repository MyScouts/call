import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/group_request_response.dart';
import 'package:app_main/src/presentation/community/widgets/day_countdown_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../community_constants.dart';

class GroupRequestWidget extends StatefulWidget {
  final GroupRequest request;
  final ValueChanged<bool> onReplyRequest;

  const GroupRequestWidget({
    super.key,
    required this.request,
    required this.onReplyRequest,
  });

  @override
  State<GroupRequestWidget> createState() => _GroupRequestWidgetState();
}

class _GroupRequestWidgetState extends State<GroupRequestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvatarWidget(
                avatar: widget.request.user?.avatar,
                size: 50,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.request.user?.displayName}',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            height: 1.2,
                          ),
                    ),
                    Text(
                      'Boss Team của Team ${widget.request.team?.name}',
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFACACAC),
                            fontSize: 16,
                            height: 1.5,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'Yêu cầu từ chức Boss Team của ${widget.request.user?.displayName}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 1.2,
                  ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF5C7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Thời gian phê duyệt còn lại',
                    softWrap: true,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0XFFFF7626),
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: DayCountdownWidget(
                    durationInSeconds: widget.request.createdAt!
                        .add(const Duration(
                            days: CommunityConstant
                                .dayForRelinquishBossGroupRequest))
                        .difference(DateTime.now())
                        .inSeconds,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Nếu bạn không phê duyệt trong thời gian đếm ngược, yêu cầu này sẽ tự động được duyệt.',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 14,
                  height: 1.4,
                  color: const Color(0xFF8C8C8C),
                  fontWeight: FontWeight.w400,
                ),
          ),
          Row(
            children: ApproveGroupRequest.values
                .map(
                  (type) => Expanded(
                    child: GestureDetector(
                      onTap: () => widget.onReplyRequest.call(type.status),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: type.buttonColor,
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: type.textColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                            children: [
                              WidgetSpan(
                                child: type.buttonIcon,
                                alignment: PlaceholderAlignment.middle,
                              ),
                              const WidgetSpan(child: SizedBox(width: 8)),
                              TextSpan(text: type.text),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
