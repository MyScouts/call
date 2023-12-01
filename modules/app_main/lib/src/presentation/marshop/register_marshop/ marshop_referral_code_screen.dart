import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
import 'package:app_main/src/data/models/responses/marshop_response.dart';
import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:app_main/src/presentation/marshop/marshop_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

class MarshopReferralCodeScreen extends StatefulWidget {
  static const String routeName = 'marshop-referral-code-screen';
  const MarshopReferralCodeScreen({super.key});

  @override
  State<MarshopReferralCodeScreen> createState() =>
      _MarshopReferralCodeScreenState();
}

class _MarshopReferralCodeScreenState extends State<MarshopReferralCodeScreen> {
  GetListMarshopBloc listBloc = injector.get();

  @override
  void initState() {
    super.initState();
    listBloc.add(
        GetListDataParam1Event(GetListMarshopPayload(page: 1, pageSize: 10)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => listBloc,
      child: BlocListener<GetListMarshopBloc, GetListState>(
        listener: (context, state) {
          if (state is GetListDataError) {
            showToastMessage(state.message, ToastMessageType.error);
          }
        },
        child: Scaffold(
          appBar: const BaseAppBar(
            isClose: false,
            title: "ID MarShop giới thiệu",
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Gợi ý",
                  style: context.text.titleSmall,
                ),
                const SizedBox(height: 10),
                _buildList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildList() {
    return BlocBuilder<GetListMarshopBloc, GetListState>(
      buildWhen: (old, state) => state is GetListDataSuccess<MarshopResponse>,
      builder: (_, state) {
        if (state is GetListDataSuccess<MarshopResponse>) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final item = state.data[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: GestureDetector(
                    onTap: () => context.pop(data: item.code),
                    child: Row(
                      children: [
                        AppAvatarWidget(
                          defaultAvatar: Assets.images_avatar.path,
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: context.text.titleMedium,
                            ),
                            Text(
                              item.code,
                              style: context.text.bodySmall,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
