// ignore_for_file: lines_longer_than_80_chars

import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import '../../../../../wallet.dart';
import '../../../../core/theme/wallet_theme.dart';
import '../../../shared/widgets/app_bar.dart';
import '../../../shared/widgets/gradiant_button.dart';
import '../../wallet_point_coodinator.dart';
import '../bloc/agency_bloc.dart';

class PointAgencyScreen extends StatelessWidget {
  static const routeName = '/all-agency';

  const PointAgencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? selectedAgencyId;

    return Scaffold(
      appBar: appbarBuilder(context, title: 'Tìm đại lý xu'),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          context.horizontal,
          25,
          context.horizontal,
          MediaQuery.of(context).padding.bottom,
        ),
        child: BlocBuilder<AgencyBloc, AgencyState>(
          buildWhen: (previous, current) =>
              current.whenOrNull(getAllAgencyLoaded: (agencies) => true) ??
              false,
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => const LoadingWidget(),
                getAllAgencyLoaded: (agencies) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Danh sách Đại lý xu',
                                style: context.text.titleMedium?.copyWith(
                                  color: AppColors.blue10,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: ListView(
                                  children: [
                                    ...agencies
                                        .map(
                                          (agency) => DecoratedBox(
                                            decoration: BoxDecoration(
                                              color:
                                                  selectedAgencyId == agency.id
                                                      ? WalletTheme.lightBlue
                                                      : AppColors.white,
                                            ),
                                            child: ListTile(
                                              onTap: () {
                                                if (selectedAgencyId !=
                                                    agency.id) {
                                                  selectedAgencyId = agency.id;
                                                } else {
                                                  selectedAgencyId = null;
                                                }
                                                setState(() {});
                                              },
                                              title: Text(
                                                'Tổng đại lý ${agency.agencyName ?? agency.displayName}',
                                                style: context.text.bodyMedium
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList()
                                  ],
                                ),
                              ),
                              const SizedBox(height: 50),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: GradiantButton(
                              onPressed: selectedAgencyId != null
                                  ? () => context.agencyInfo(selectedAgencyId!)
                                  : null,
                              child: const Text('XEM ĐẠI LÝ'),
                            ),
                          )
                        ],
                      );
                    },
                  );
                });
          },
        ),
      ),
    );
  }
}
