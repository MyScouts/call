
//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/chat/add_member/cubit/add_member_cubit.dart';
import 'package:app_main/src/presentation/chat/add_member/cubit/add_member_state.dart';
import 'package:app_main/src/presentation/chat/widgets/friend_select_widget.dart';
import 'package:app_main/src/presentation/chat/widgets/friend_selected_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

class AddMemberPage extends StatefulWidget {
  final int conversationId;
  static const routeName = 'AddMemberPage';

  const AddMemberPage({super.key, required this.conversationId});

  @override
  AddMemberPageState createState() => AddMemberPageState();
}

class AddMemberPageState extends State<AddMemberPage> {
  final AddMemberCubit _cubit = getIt.get();

  @override
  void initState() {
    _cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddMemberCubit, AddMemberState>(
      bloc: _cubit,
      builder: (context, state) {
        return state.when(
              (friends, listChoice, page, canLoadMore, keySearch) {
            return Scaffold(
              appBar: BaseAppBar(
                title: 'Thêm thành viên',
                isClose: false,
                actions: [
                  TextButton(
                    onPressed: listChoice.isNotEmpty ? () async {
                      _cubit.addMember(widget.conversationId).then((value) {
                        if(value) {
                          Navigator.pop(context);
                        }
                      });
                    } : null,
                    child: Text(
                      'Tiếp tục',
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: listChoice.isNotEmpty
                            ? AppColors.blueEdit
                            : const Color(0x26000000),
                      ),
                    ),
                  ),
                ],
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (listChoice.isNotEmpty) ...[
                    SizedBox(
                      height: 84,
                      child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return FriendSelectedWidget(
                              data: listChoice[index],
                              onTap: () {
                                _cubit.updateChoice(listChoice[index]);
                              },
                            );
                          },
                          separatorBuilder: (_, __) => kSpacingWidth12,
                          itemCount: listChoice.length),
                    ),
                    kSpacingHeight24,
                  ],
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Gợi ý',
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  kSpacingHeight16,
                  Expanded(
                    child: ListView.separated(
                        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                        itemBuilder: (_, index) {
                          if (index == friends.length) {
                            _cubit.loadMore();
                            return const LoadingWidget();
                          } else {
                            return FriendSelectWidget(
                              data: friends[index],
                              isSelected: listChoice.contains(friends[index]),
                              onTap: () {
                                _cubit.updateChoice(friends[index]);
                              },
                            );
                          }
                        },
                        separatorBuilder: (_, __) => kSpacingHeight12,
                        itemCount: canLoadMore ? friends.length + 1 : friends.length),
                  ),
                ],
              ),
            );
          },
          loading: () => const LoadingWidget(),
          error: (e) => const SizedBox(),
        );
      },
    );
  }
}
