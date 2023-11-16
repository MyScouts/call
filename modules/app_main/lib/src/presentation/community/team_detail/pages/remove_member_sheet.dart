import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:app_main/src/presentation/community/team_detail/bloc/team_detail_bloc.dart';
import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import 'ask_to_kick_member.dart';

class RemoveMemberSheet extends StatefulWidget {
  static const String routerName = '/groups/team/remove_member';

  const RemoveMemberSheet({super.key});

  @override
  State<RemoveMemberSheet> createState() => _RemoveMemberSheetState();
}

class _RemoveMemberSheetState extends State<RemoveMemberSheet> {
  bool enableChoose = false;
  final TextEditingController search = TextEditingController();
  bool isSearching = false;
  List<User> _members = [];
  Map<int, User> _chooseRemove = {};
  Team? _team;

  String get nameConfirm {
    final List<String> names = [];
    for (final x in _chooseRemove.keys.toList()) {
      names.add(_chooseRemove[x].getdisplayName);
    }

    return names.join(',');
  }

  late final TeamDetailBloc bloc = context.read<TeamDetailBloc>();

  @override
  void initState() {
    super.initState();
    final state = bloc.state;
    _members = (state as FetchTeamsMemberSuccess).members;
    _team = (state).team;
    _sub = bloc.stream.listen((event) {
      setState(() {
        _members = (bloc.state as FetchTeamsMemberSuccess).members;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  StreamSubscription? _sub;

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          'Loại bỏ thành viên',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Expanded(child: _ListMemberHeader()),
                  TextButton(
                    onPressed: () {
                      if (enableChoose) {
                        _chooseRemove = {};
                      }
                      setState(() {
                        enableChoose = !enableChoose;
                      });
                    },
                    child: Text(
                      enableChoose ? 'Huỷ' : 'Chọn',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff4B84F7),
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: search,
                onChanged: (value) async {
                  EasyDebounce.debounce(
                    'testDeb',
                    const Duration(milliseconds: 300),
                    () async {
                      final state = context.read<TeamDetailBloc>().state
                          as FetchTeamsMemberSuccess;
                      List<User> members;
                      if (value.trim().isEmpty) {
                        members = state.members.map((e) => e).toList();
                      } else {
                        members = state.members
                            .where((e) =>
                                (e.vShopId?.contains(value) ?? false) ||
                                (e.displayName?.contains(value) ?? false))
                            .toList();
                      }
                      setState(() {
                        isSearching = true;
                        _members = members;
                      });
                    },
                  );
                },
                style: context.text.titleMedium!.copyWith(color: Colors.grey),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  isDense: false,
                  hintText: "Tìm kiếm thành viên",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: AppColors.grey14),
                  fillColor: const Color(0XFFF2F2F2),
                  filled: true,
                  suffixIcon: IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {
                      search.clear();
                    },
                    icon: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0XFFACACAC),
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: const Icon(
                        Icons.clear,
                        size: 11,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ..._members
                  .map<Widget>(
                    (e) => GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_chooseRemove.keys.contains(e.id)) {
                            _chooseRemove.remove(e.id ?? 0);
                          } else {
                            _chooseRemove[e.id!] = e;
                          }
                        });
                      },
                      behavior: HitTestBehavior.opaque,
                      child: _UserCard(
                        user: e,
                        enableChoose: enableChoose,
                        active: _chooseRemove.keys.contains(e.id),
                        force: () async {
                          final ok = await showDialog(
                                context: context,
                                builder: (_) => KickMemberForce(
                                  user: e,
                                  teamName: _team?.name ?? '',
                                ),
                              ) ??
                              false;
                          if (ok) {
                            bloc.add(KickMember(e.id ?? 0, _team?.id ?? ''));
                          }
                        },
                      ),
                    ),
                  )
                  .toList()
                  .separated(const SizedBox(height: 8)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: enableChoose
          ? SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromHeight(48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: const Color(0xffDE372D),
                  ),
                  onPressed: () async {
                    if (_chooseRemove.keys.isEmpty) return;
                    final ok = await showDialog(
                          context: context,
                          builder: (_) => AskToKickMember(text: nameConfirm),
                        ) ??
                        false;

                    if (ok) {
                      for (final x in _chooseRemove.keys.toList()) {
                        bloc.add(KickMember(x, _team?.id ?? ''));
                      }
                    }
                  },
                  child: const Text(
                    'Loại bỏ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({
    required this.user,
    this.enableChoose = false,
    this.active = false,
    this.force,
  });

  final User user;
  final bool enableChoose;
  final bool active;
  final Function()? force;

  @override
  Widget build(BuildContext context) {
    final isBossTeam =
        context.read<UserCubit>().currentUser?.pDoneId == user.pDoneId;

    return Row(
      children: [
        if (enableChoose && !isBossTeam) ...[
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeInOut,
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border:
                  !active ? Border.all(color: const Color(0xffE1E1E1)) : null,
            ),
            child: active
                ? ImageWidget(
                    IconAppConstants.icCheckCircle,
                    fit: BoxFit.fill,
                  )
                : const SizedBox.shrink(),
          ),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleNetworkImage(
                  url: user.avatar ?? '',
                  size: 40,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.getdisplayName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ID: ${user.pDoneId ?? ''}',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffACACAC),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                if (!isBossTeam)
                  TextButton(
                    onPressed: force,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: const Color(0xffDE372D),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Loại bỏ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ListMemberHeader extends StatelessWidget {
  const _ListMemberHeader();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TeamDetailBloc>().state;
    final members = (state as FetchTeamsMemberSuccess).members;
    return Text(
      'Danh sách thành viên - (${members.length}/500)',
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
