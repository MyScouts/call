//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/friend/friend_model.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/call/call_1v1/call_1v1_coordinator.dart';
import 'package:app_main/src/presentation/call/phone_book_detail/cubit/phone_book_detail_cubit.dart';
import 'package:app_main/src/presentation/call/phone_book_detail/cubit/phone_book_detail_state.dart';
import 'package:app_main/src/presentation/call/widgets/avatar_caller_widget.dart';
import 'package:app_main/src/presentation/call/widgets/call_button_widget.dart';
import 'package:app_main/src/presentation/call/widgets/call_history_detail_widget.dart';
import 'package:app_main/src/presentation/call/widgets/call_history_widget.dart';
import 'package:app_main/src/presentation/call/widgets/no_data_widget.dart';
import 'package:app_main/src/presentation/call/widgets/video_call_button_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

class PhoneBookDetailPage extends StatefulWidget {
  final FriendModel data;
  static const routeName = 'PhoneBookDetailPage';

  const PhoneBookDetailPage({super.key, required this.data});

  @override
  PhoneBookDetailPageState createState() => PhoneBookDetailPageState();
}

class PhoneBookDetailPageState extends State<PhoneBookDetailPage> {
  final PhoneBookDetailCubit _cubit = getIt.get();

  @override
  void initState() {
    _cubit.init(widget.data.id ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AvatarCallerWidget(
                avatar: widget.data.avatar ?? '',
                size: 100,
              ),
            ),
            kSpacingWidth12,
            Text(
              widget.data.displayName ?? '',
              style: context.textTheme.titleMedium!.copyWith(
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            kSpacingHeight2,
            Text(
              widget.data.pDoneId ?? '',
              style: context.textTheme.titleMedium!.copyWith(
                fontSize: 12,
                color: AppColors.grey14,
              ),
            ),
            kSpacingHeight24,
            Row(
              children: [
                Expanded(
                  child: CallButtonWidget(
                    onTap: () {
                      context.startCall(
                        toUserId: widget.data.id.toString(),
                        isVideo: false,
                        fromUserId:
                            getIt.get<UserSharePreferencesUsecase>().getUserInfo()?.id.toString(),
                      );
                    },
                  ),
                ),
                kSpacingWidth12,
                Expanded(
                  child: VideoCallButtonWidget(
                    onTap: () {
                      context.startCall(
                        toUserId: widget.data.id.toString(),
                        isVideo: true,
                        fromUserId:
                            getIt.get<UserSharePreferencesUsecase>().getUserInfo()?.id.toString(),
                      );
                    },
                  ),
                ),
              ],
            ),
            kSpacingHeight24,
            Row(
              children: [
                Text(
                  'Lịch sử cuộc gọi',
                  style: context.textTheme.titleMedium!.copyWith(
                    fontSize: 14,
                    color: AppColors.greyLightTextColor,
                  ),
                ),
              ],
            ),
            kSpacingHeight12,
            Expanded(
              child: BlocBuilder<PhoneBookDetailCubit, PhoneBookDetailState>(
                bloc: _cubit,
                builder: (_, state) {
                  return state.when((data, canLoadMore, page) {
                    if (data.isEmpty) {
                      return const NoDataWidget();
                    }
                    return ListView.separated(
                        itemBuilder: (_, index) {
                          if (index == data.length && canLoadMore) {
                            _cubit.loadMore(widget.data.id ?? 0);
                            return const LoadingWidget();
                          }
                          return CallHistoryDetailWidget(data: data[index]);
                        },
                        separatorBuilder: (_, __) => kSpacingHeight12,
                        itemCount: canLoadMore ? data.length + 1 : data.length);
                  }, loading: () => const LoadingWidget(), error: (error) => const SizedBox());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
