import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/usecases/dashboard_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:app_main/src/presentation/dashboard_v2/widget/dashboard_base_v2.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:imagewidget/imagewidget.dart';

enum _ScreenType {
  c,
  p,
  e;

  String get icon {
    if (this == _ScreenType.c) return IconAppConstants.icC;
    if (this == _ScreenType.p) return IconAppConstants.icP;
    return IconAppConstants.icE;
  }

  String get title {
    if (this == _ScreenType.c) return 'Màn C';
    if (this == _ScreenType.p) return 'Màn P';
    return 'Màn E';
  }
}

class DashboardDrawer extends StatefulWidget {
  const DashboardDrawer({super.key, required this.page});

  final int page;

  @override
  State<DashboardDrawer> createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer> {
  _ScreenType? _type;
  String id = '';
  late final userId = context.read<UserCubit>().currentUser?.id ?? '';

  late List<DashBoardItem> items = widget.page == 0
      ? communityItems
      : (widget.page == 1 ? personalItems : ecoItems);

  @override
  void initState() {
    final page = useCase.getPageInitial('$userId');
    if (page != null) {
      _type = _ScreenType.values[page];
    }
    if (_type == null) {
      id = useCase.getInitPath('$userId') ?? '';
    }
    super.initState();
  }

  DashboardSharePreferenceUseCase get useCase =>
      getIt<DashboardSharePreferenceUseCase>();

  @override
  void dispose() {
    if (id.trim().isNotEmpty) {
      useCase.saveInitPath('$userId', id);
    } else {
      useCase.removeInitPath('$userId');
    }
    if (_type != null) {
      final index = _ScreenType.values.indexOf(_type!);
      useCase.savePage('$userId', index);
    } else {
      useCase.removePage('$userId');
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: CloseButton(color: Colors.black),
                ),
                const Text(
                  'Màn hình mặc định',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                ..._ScreenType.values
                    .map<Widget>(
                      (e) => Row(
                        children: [
                          Radio(
                            fillColor: _type == e
                                ? const MaterialStatePropertyAll(
                                    Color(0xff4B84F7))
                                : const MaterialStatePropertyAll(
                                    Color(0xffCECECE)),
                            value: _type,
                            groupValue: e,
                            onChanged: (_) {
                              setState(() {
                                _type = e;
                                id = '';
                                if (_type == _ScreenType.c) {
                                  items = communityItems;
                                } else if (_type == _ScreenType.p) {
                                  items = personalItems;
                                } else {
                                  items = ecoItems;
                                }
                              });
                            },
                          ),
                          const SizedBox(width: 6),
                          SizedBox.square(
                            dimension: 40,
                            child: ImageWidget(e.icon),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            e.title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                              color: Color(0xff6E6E6E),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList()
                    .separated(const SizedBox(height: 8)),
                const SizedBox(height: 16),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xffE1E1E1),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Cài đặt nhanh ứng dụng',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                ...items
                    .map<Widget>((e) => _Items(
                          item: e,
                          onChanged: () {
                            setState(() {
                              id = e.id;
                              _type = null;
                            });
                          },
                          active: id == e.id,
                        ))
                    .toList()
                    .separated(const SizedBox(height: 8)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Items extends StatelessWidget {
  const _Items({
    super.key,
    required this.item,
    this.active = false,
    required this.onChanged,
  });

  final DashBoardItem item;
  final bool active;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          fillColor: active
              ? const MaterialStatePropertyAll(Color(0xff4B84F7))
              : const MaterialStatePropertyAll(Color(0xffCECECE)),
          value: active,
          groupValue: true,
          onChanged: (_) => onChanged(),
        ),
        const SizedBox(width: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: SizedBox.square(
            dimension: 40,
            child: ImageWidget(item.backgroundImage),
          ),
        ),
        const SizedBox(width: 20),
        Text(
          item.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.2,
            color: Color(0xff6E6E6E),
          ),
        ),
      ],
    );
  }
}
