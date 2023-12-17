import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/marshop_response.dart';
import 'package:app_main/src/presentation/marshop/marshop_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

import '../marshop_bloc.dart';

class RegisterMarshopPackScreen extends StatefulWidget {
  static String routeName = 'register-marshop-pack';
  final User authInfo;
  final MarshopResponse marshop;
  const RegisterMarshopPackScreen({
    super.key,
    required this.authInfo,
    required this.marshop,
  });

  @override
  State<RegisterMarshopPackScreen> createState() =>
      _RegisterMarshopPackScreenState();
}

class _RegisterMarshopPackScreenState extends State<RegisterMarshopPackScreen> {
  MarshopRegisterPackResponse? _pack;
  ListMarshopRegisterPackBloc get _bloc =>
      context.read<ListMarshopRegisterPackBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetListDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: "Chọn gói MarShop",
        isClose: false,
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
            vertical: 20,
          ),
          child: Column(
            children: [
              Expanded(child: _buildList()),
              PrimaryButton(
                title: "Tiếp tục",
                onTap: () => context.startConfirmInfomationScreen(
                  pack: _pack!,
                  authInfo: widget.authInfo,
                  marshop: widget.marshop,

                ),
                disabled: _pack == null,
                width: null,
              )
            ],
          )),
    );
  }

  _buildList() {
    return BlocBuilder<ListMarshopRegisterPackBloc, GetListState>(
      buildWhen: (old, state) =>
          state is GetListDataSuccess<MarshopRegisterPackResponse>,
      builder: (_, state) {
        if (state is GetListDataSuccess<MarshopRegisterPackResponse>) {
          return ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              final item = state.data[index];
              return GestureDetector(
                onTap: () {
                  _pack = item;
                  setState(() {});
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1.5,
                      color: _pack != null && _pack!.id == item.id
                          ? context.theme.primaryColor
                          : AppColors.grey13,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Assets.icons_ic_pack.image(width: 25),
                          const SizedBox(width: 5),
                          Text(
                            item.name,
                            style: context.textTheme.titleSmall,
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        item.price.toAppCurrencyString(),
                        style: context.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: context.theme.primaryColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            context.tartRegisterPackDetailScreen(pack: item),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Xem chi tiết",
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: context.theme.primaryColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
