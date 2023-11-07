import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/community/groups/group_listing_bloc.dart';
import 'package:app_main/src/presentation/community/groups/groups_listing_widget.dart';
import 'package:app_main/src/presentation/community/groups/widget/tab-bar-groups.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

class CommunityWidget extends StatefulWidget {
  static const String routeName = 'community';

  const CommunityWidget({super.key});

  @override
  State<CommunityWidget> createState() => _CommunityWidgetState();
}

class _CommunityWidgetState extends State<CommunityWidget> with SingleTickerProviderStateMixin {
  late TabController _communityTabController;

  @override
  void initState() {
    _communityTabController = TabController(length: 2, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _communityTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // appBar: AppBar(toolbarHeight: 0,elevation: 0,toolbarOpacity: 0),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: ColoredBox(
            color: AppColors.bgColor,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      const AvatarWidget(),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SearchBar(
                          hintText: 'Tìm kiếm',
                          hintStyle: MaterialStatePropertyAll(Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: const Color(0xff858589),
                              )),
                          textStyle: MaterialStatePropertyAll(Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: const Color(0xff858589),
                              )),
                          leading: const Icon(
                            Icons.search,
                            color: Color(0xff858589),
                          ),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                          shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                          backgroundColor: const MaterialStatePropertyAll(Color(0xfff5f5f5)),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: ImageWidget(IconAppConstants.bell),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: ImageWidget(IconAppConstants.menu),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                TabBarGroups(controller: _communityTabController),
                Expanded(
                  child: TabBarView(
                    controller: _communityTabController,
                    children: [
                      Container(),
                      MultiBlocProvider(
                        providers: [
                          BlocProvider<GetListGroupsBloc>(
                            create: (context) => injector.get()..add(GetListDataEvent()),
                          ),
                          BlocProvider<GetFanGroupBloc>(
                            create: (context) => injector.get(),
                          )
                        ],
                        child: const GroupsListingWidget(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
