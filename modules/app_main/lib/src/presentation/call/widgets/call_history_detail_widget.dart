//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/call/call_history_model.dart';
import 'package:app_main/src/presentation/call/widgets/avatar_caller_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class CallHistoryDetailWidget extends StatelessWidget {
  final CallHistoryModel data;
  const CallHistoryDetailWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.bgCard,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateTime.tryParse(data.calledAt ?? '')?.tohhmm ?? '',
                style: context.textTheme.headlineSmall?.copyWith(
                  color: AppColors.black,
                ),
              ),
              kSpacingHeight2,
              Row(
                children: [
                  ImageWidget(
                    data.isCaller ? IconAppConstants.icCallAway : IconAppConstants.icIncomingCall,
                    width: 16,
                    height: 16,
                  ),
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
        ],
      ),
    );
  }
}
