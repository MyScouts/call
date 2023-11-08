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
  final SearchCubit _bloc = injector.get<SearchCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocListener<SearchCubit, SearchState>(
        listener: (context, state) {
          print(state);
        },
        child: ScaffoldHideKeyboard(
          body: SafeArea(
              child: Column(
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
                        onChanged: (value) async {
                          EasyDebounce.debounce(
                              'testDeb', const Duration(milliseconds: 300),
                              () async {
                            _bloc.searchUser(
                                query: _searchCtrl.text.trim(), isReset: true);
                          });
                        },
                        style: context.text.titleMedium!
                            .copyWith(color: Colors.grey),
                        decoration: InputDecoration(
                          isDense: true,
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
                            splashColor: Colors.transparent,
                            onPressed: () {
                              _searchCtrl.clear();
                              _bloc.searchUser(query: "", isReset: true);
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
                    )
                  ],
                ),
              ),
              Expanded(child: _buildSearch()),
            ],
          )),
        ),
      ),
    );
  }

  _buildUser(SearchDetail user) {
    return GestureDetector(
      onTap: () => context.startDiary(userId: user.user.id.toString()),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
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
                      user.user.displayName,
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
                  "ID: ${user.user.pDoneId}",
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

  _buildSearch() {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final users = state.users;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Text("Người dùng (${users.length})",
                  style: context.text.titleSmall),
              const SizedBox(height: 10),
              if (state is OnSearchUser && state.isFirstPage)
                const Center(child: CircularProgressIndicator()),
              if (state is SearchUserSuccess && state.users.isEmpty)
                const Center(child: Text("Không tìm thấy người dùng.")),
              Expanded(
                  child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return _buildUser(user);
                },
              ))
            ],
          ),
        );
      },
    );
  }
}
