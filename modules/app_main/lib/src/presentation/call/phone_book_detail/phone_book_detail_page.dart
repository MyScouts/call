  //import 'dart:developer' as developer;
  import 'package:app_core/app_core.dart';
  import 'package:app_main/src/di/di.dart';
  import 'package:app_main/src/domain/entities/chat/member_model.dart';
  import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
  import 'package:app_main/src/presentation/call/call_1v1/call_1v1_coordinator.dart';
  import 'package:app_main/src/presentation/call/phone_book_detail/cubit/phone_book_detail_cubit.dart';
  import 'package:app_main/src/presentation/call/phone_book_detail/cubit/phone_book_detail_state.dart';
  import 'package:app_main/src/presentation/call/widgets/avatar_caller_widget.dart';
  import 'package:app_main/src/presentation/call/widgets/call_button_widget.dart';
  import 'package:app_main/src/presentation/call/widgets/call_history_detail_widget.dart';
  import 'package:app_main/src/presentation/call/widgets/no_data_widget.dart';
  import 'package:app_main/src/presentation/call/widgets/video_call_button_widget.dart';
  import 'package:design_system/design_system.dart';
  import 'package:flutter/material.dart';
  import 'package:imagewidget/imagewidget.dart';
  import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
  import 'package:ui/ui.dart';

  class PhoneBookDetailPage extends StatefulWidget {
    final MemberModel data;
    static const routeName = 'PhoneBookDetailPage';

    const PhoneBookDetailPage({super.key, required this.data});

    @override
    PhoneBookDetailPageState createState() => PhoneBookDetailPageState();
  }

  class PhoneBookDetailPageState extends State<PhoneBookDetailPage> {
    final PhoneBookDetailCubit _cubit = getIt.get();

    @override
    void initState() {
      _cubit.init(widget.data.id);
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 6,
          actions: [
            PopupMenuButton<int>(
              icon: const Icon(
                Icons.more_vert,
                color: AppColors.black,
              ),
              color: AppColors.white,
              onSelected: (i) {
                showDialog(
                  context: context,
                  builder: (_) => ChatDialog(
                    title: 'Xóa cuộc gọi',
                    content: 'Bạn có chắc chắn muốn xóa lịch sử cuộc gọi này không?',
                    actionTitle: 'Xóa',
                    onAction: () {
                      _cubit.deleteHistoryCall(widget.data.id);
                    },
                  ),
                );
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        ImageWidget(
                          IconAppConstants.icDeleteCall,
                          width: 24,
                          height: 24,
                        ),
                        kSpacingWidth20,
                        Text(
                          'Xóa lịch sử cuộc gọi',
                          style: context.text.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: AvatarWidget(
                  avatar: widget.data.avatar ?? '',
                  size: 100,
                ),
              ),
              kSpacingHeight12,
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
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey14,
                ),
              ),
              kSpacingHeight24,
              Row(
                children: [
                  Expanded(
                    child: CallButtonWidget(
                      onTap: () async {
                        await context.startCall(
                          toUserId: widget.data.id.toString(),
                          isVideo: false,
                          incomingUI: false,
                          fromUserId:
                              getIt.get<UserSharePreferencesUsecase>().getUserInfo()?.id.toString(),
                        );
                        _cubit.init(widget.data.id);
                      },
                    ),
                  ),
                  kSpacingWidth12,
                  Expanded(
                    child: VideoCallButtonWidget(
                      onTap: () async {
                         await context.startCall(
                          toUserId: widget.data.id.toString(),
                          isVideo: true,
                           incomingUI: false,
                           fromUserId:
                              getIt.get<UserSharePreferencesUsecase>().getUserInfo()?.id.toString(),
                        );
                        _cubit.init(widget.data.id);
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
