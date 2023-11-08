import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/search_user_response.dart';
import 'package:app_main/src/presentation/dashboard/search/blocs/search/search_cubit.dart';
import 'package:app_main/src/presentation/social/profile/diary_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "search";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchCtrl = TextEditingController();
  SearchCubit get _bloc => injector.get<SearchCubit>();

  @override
  void initState() {
    super.initState();
    _searchCtrl.addListener(() {
      EasyDebounce.debounce('testDeb', const Duration(milliseconds: 300),
          () async {
        if (_searchCtrl.text.trim().isEmpty) return;
        _bloc.searchUser(query: _searchCtrl.text.trim(), isReset: true);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: ScaffoldHideKeyboard(
        body: SafeArea(child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            final users = state.users;
            return Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: paddingHorizontal),
                  child: Row(
                    children: [
                      const CustomBackButton(),
                      Expanded(
                        child: TextField(
                          controller: _searchCtrl,
                          style: context.text.titleMedium!
                              .copyWith(color: Colors.grey),
                          decoration: InputDecoration(
                            hintText: "Tìm kiếm...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: const Icon(Icons.search),
                            fillColor: const Color(0XFFF2F2F2),
                            filled: true,
                            suffixIcon: IconButton(
                              onPressed: () => _searchCtrl.clear(),
                              icon: const Icon(Icons.clear, size: 15),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (state is OnSearchUser && state.isFirstPage)
                  const Center(child: CircularProgressIndicator()),
                Expanded(
                    child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return _buildUser(user);
                  },
                ))
              ],
            );
          },
        )),
      ),
    );
  }

  _buildUser(SearchUser user) {
    return GestureDetector(
      onTap: () => () => context.startDiary(userId: user.id.toString()),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.theme.primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(90),
              ),
              child: ClipRRect(
                child: ImageWidget(
                  ImageConstants.defaultUserAvatar,
                  borderRadius: 100,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      user.displayName,
                      style: context.textTheme.titleMedium!.copyWith(
                        fontSize: 15,
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  "ID: ${user.pDoneId}",
                  style: context.textTheme.titleMedium!.copyWith(
                    fontSize: 13,
                    color: AppColors.grey14,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
