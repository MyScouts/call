import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/approved_request/approved_request_cubit.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class ListFollowRequestTab extends StatefulWidget {
  const ListFollowRequestTab({super.key});

  @override
  State<ListFollowRequestTab> createState() => _ListFollowRequestTabState();
}

class _ListFollowRequestTabState extends State<ListFollowRequestTab> {
  final ApprovedRequestCubit _cubit = injector.get<ApprovedRequestCubit>();
  @override
  void initState() {
    super.initState();
    _cubit.getApprovedRequest();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Danh sách yêu cầu theo dõi"),
            const SizedBox(height: 10),
            Expanded(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  _buildContent() {
    return BlocBuilder<ApprovedRequestCubit, ApprovedRequestState>(
      builder: (context, state) {
        final requests = state.approvedRequest;
        return Column(
          children: [
            if (state is OnGetApprovedRequest)
              const Center(child: AppCircleIndicator()),
            if (requests.isNotEmpty)
              Expanded(
                  child: ListView.separated(
                separatorBuilder: (_, __) => const Divider(),
                itemCount: requests.length,
                itemBuilder: (context, index) {
                  final request = requests[index];
                  final user = request.followee;
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppAvatarWidget(
                          avatar: "",
                          defaultAvatar: ImageConstants.defaultUserAvatar,
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    user?.displayName ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2,
                                    ),
                                  ),
                                  Text(
                                    DateTime.parse(request.createdAt)
                                        .toHumanReadable,
                                    style: context.textTheme.titleSmall!
                                        .copyWith(
                                            color: const Color(0xffACACAC)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'yêu cầu theo dõi',
                                style: context.textTheme.titleSmall!
                                    .copyWith(color: const Color(0xffACACAC)),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(
                                    child: PrimarySolidButton(
                                      title: "Đồng ý",
                                      height: 40,
                                      onTap: () {},
                                      disabled: false,
                                      width: null,
                                      color: const Color(0XFFF4F4F4),
                                      textColor: AppColors.grey40,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: PrimarySolidButton(
                                      title: "Đồng ý",
                                      height: 40,
                                      onTap: () {},
                                      disabled: false,
                                      width: null,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ))
          ],
        );
      },
    );
  }
}
