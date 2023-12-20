//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/call/call_history_model.dart';
import 'package:app_main/src/presentation/call/call_coordinator.dart';
import 'package:app_main/src/presentation/call/models/call_1vs1_state_data.dart';
import 'package:app_main/src/presentation/call/phone_book/tabs/call_history/cubit/call_history_cubit.dart';
import 'package:app_main/src/presentation/call/widgets/avatar_caller_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class CallHistoryWidget extends StatelessWidget {
  final CallHistoryModel data;
  final CallHistoryCubit cubit;
  const CallHistoryWidget({super.key, required this.data, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await context.startCallById(
            participantID: data.callGroup.membersNotMe.first.member.id,
            callType: data.type == 1 ? CallType.audio : CallType.video);
        cubit.init();
      },
      child: SizedBox(
        child: Row(
          children: [
            AvatarWidget(avatar: data.callGroup.members.first.member.avatar, size: 40),
            kSpacingWidth16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.callGroup.membersNotMe.first.member.displayName ?? '',
                    style: context.textTheme.headlineSmall?.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  kSpacingHeight2,
                  Row(
                    children: [
                      ImageWidget(
                        data.isMissingCall
                            ? IconAppConstants.icMissingCall
                            : data.isCaller
                                ? IconAppConstants.icCallAway
                                : IconAppConstants.icIncomingCall,
                        width: 16,
                        height: 16,
                      ),
                      kSpacingWidth2,
                      Text(
                        data.des,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Text(
              DateTime.tryParse(data.calledAt ?? '')?.toLocal().tohhmm ?? '',
              style: context.textTheme.titleMedium?.copyWith(
                fontSize: 11,
              ),
            ),
            kSpacingWidth24,
          ],
        ),
      ),
    );
  }
}
