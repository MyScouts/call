import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:app_main/src/core/utils/loading_indicator/platform_loading.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:app_main/src/presentation/community/team_detail/bloc/team_detail_bloc.dart';
import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:injectable/injectable.dart';

import '../../../../blocs/user/user_cubit.dart';

class AddTeamMemberSheet extends StatefulWidget {
  const AddTeamMemberSheet({super.key});

  @override
  State<AddTeamMemberSheet> createState() => _AddTeamMemberSheetState();
}

class _AddTeamMemberSheetState extends State<AddTeamMemberSheet> {
  late final controller = getIt<AddMemberChangeNotifier>();
  final TextEditingController search = TextEditingController();

  final myId = injector.get<UserCubit>().currentUser?.id;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Scaffold(
          appBar: AppBar(
            leading: const CloseButton(),
            centerTitle: true,
            title: const Text(
              'Thêm thành viên mới',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () async {
                    context.showLoading();
                    final state = context.read<TeamDetailBloc>().state;
                    final team = (state as FetchTeamsMemberSuccess).team;
                    await controller.confirm(team.id ?? '');
                    context.hideLoading();
                    Navigator.of(context).pop();
                    context.showToastMessage('Mời thành viên thành công');
                  },
                  child: const Text(
                    'Thêm',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff4B84F7),
                    ),
                  ),
                ),
              )
            ],
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  TextField(
                    controller: search,
                    style: context.text.titleMedium!.copyWith(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      isDense: false,
                      hintText: "Tìm kiếm ID VDONE",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xffD0D6DD)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff4B84F7)),
                      ),
                      prefixIcon:
                          const Icon(Icons.search, color: AppColors.grey14),
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: ListenableBuilder(
                                listenable: Listenable.merge([
                                  controller,
                                ]),
                                builder: (_, __) {
                                  return Row(
                                    children: controller.addFriend
                                        .map<Widget>((e) => _CircleUser(
                                              user: e,
                                              onClick: () =>
                                                  controller.removeFriend(e),
                                            ))
                                        .toList()
                                        .separated(const SizedBox(width: 20)),
                                  );
                                },
                              ),
                            ),
                          ),
                          const Text(
                            'Gợi ý',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ListenableBuilder(
                            listenable: Listenable.merge([
                              controller,
                              search,
                            ]),
                            builder: (_, __) {
                              if (controller.isLoading) {
                                return const Center(
                                  child: PlatformLoadingIndicator(size: 30),
                                );
                              }

                              final friendList = controller.friends
                                  .where((friend) => friend.id != myId)
                                  .toList();

                              if (search.text.trim().isNotEmpty) {
                                final users = controller.friends
                                    .where((friend) => friend.id != myId)
                                    .where((e) =>
                                        e.pDoneId?.contains(search.text) ??
                                        false)
                                    .toList();

                                return ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  itemBuilder: (_, index) => _UserFriendCard(
                                    user: users[index],
                                    active: controller.addFriend
                                        .contains(users[index]),
                                    callBack: () {
                                      if (controller.addFriend
                                          .contains(users[index])) {
                                        controller.removeFriend(users[index]);
                                      } else {
                                        controller.add(users[index]);
                                      }
                                    },
                                  ),
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 10),
                                  itemCount: users.length,
                                );
                              }

                              return ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                itemBuilder: (_, index) {
                                  return _UserFriendCard(
                                    user: friendList[index],
                                    active: controller.addFriend
                                        .contains(friendList[index]),
                                    callBack: () {
                                      if (controller.addFriend
                                          .contains(friendList[index])) {
                                        controller
                                            .removeFriend(friendList[index]);
                                      } else {
                                        controller.add(friendList[index]);
                                      }
                                    },
                                  );
                                },
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 10),
                                itemCount: friendList.length,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _UserFriendCard extends StatelessWidget {
  const _UserFriendCard({
    super.key,
    required this.user,
    this.active = false,
    this.callBack,
  });

  final bool active;
  final User user;
  final VoidCallback? callBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          CircleNetworkImage(
            url: user.avatar ?? '',
            size: 40,
            defaultImage: ImageWidget(ImageConstants.defaultAvatar),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  user.getdisplayName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'ID: ${user.pDoneId}',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffACACAC),
                  ),
                ),
              ],
            ),
          ),
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
      ),
    );
  }
}

class _CircleUser extends StatelessWidget {
  const _CircleUser({
    super.key,
    required this.user,
    required this.onClick,
  });

  final VoidCallback onClick;
  final User user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleNetworkImage(
                url: user.avatar ?? '',
                size: 48,
                defaultImage: ImageWidget(ImageConstants.defaultAvatar),
              ),
              Positioned(
                top: -2,
                right: 2,
                child: GestureDetector(
                  onTap: onClick,
                  behavior: HitTestBehavior.opaque,
                  child: const CircleAvatar(
                    radius: 10,
                    backgroundColor: Color(0xff3F3F46),
                    child: Icon(
                      Icons.close,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            user.getdisplayName,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

@injectable
class AddMemberChangeNotifier extends ChangeNotifier {
  final UserUsecase useCase;

  AddMemberChangeNotifier(this.useCase) {
    _initData();
  }

  List<User> _friends = [];

  List<User> _addFriend = [];

  List<User> get addFriend => _addFriend;

  void add(User user) {
    _addFriend.add(user);
    notifyListeners();
  }

  void removeFriend(User user) {
    _addFriend.remove(user);
    notifyListeners();
  }

  List<User> get friends => _friends;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  void _initData() async {
    final res = await useCase.listFriends();
    _friends = res;
    _isLoading = false;
    notifyListeners();
  }

  Future confirm(String teamID) async {
    if (addFriend.isEmpty) return;
    for (final i in addFriend) {
      await useCase.invite(teamID, {'userId': i.id});
    }
  }
}
