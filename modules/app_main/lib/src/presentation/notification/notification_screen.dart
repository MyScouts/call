import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/loading_indicator/platform_loading.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/notification/notification_data.dart';
import 'package:app_main/src/presentation/notification/state/notification_bloc.dart';
import 'package:app_main/src/presentation/notification/widget/notification_card.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:imagewidget/imagewidget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ui/ui.dart';

class NotificationScreen extends StatefulWidget {
  static const String routerName = '/notification';

  const NotificationScreen({super.key, required this.onClose});

  final Function() onClose;

  @override
  State<NotificationScreen> createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  final bloc = getIt<NotificationBloc>();
  late AnimationController controller;
  late final Animation<Offset> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animation = Tween<Offset>(
      begin: Offset(0, -MediaQuery.of(context).size.height),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  void forward() => controller.forward();

  void revert() => controller.reverse();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          return Transform.translate(
            offset: animation.value,
            child: ClipRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Scaffold(
                  backgroundColor: Colors.black.withOpacity(.3),
                  body: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    behavior: HitTestBehavior.opaque,
                    child: BlocBuilder<NotificationBloc, NotificationState>(
                      builder: (ctx, state) {
                        final bloc = ctx.read<NotificationBloc>();

                        return SafeArea(
                          bottom: false,
                          child: SmartRefresher.builder(
                            controller: bloc.controller,
                            enablePullDown: true,
                            enablePullUp: state.hasLoadMore,
                            onRefresh: () => bloc.add(Fetch()),
                            onLoading: () => bloc.add(LoadMore()),
                            builder: (_, __) {
                              return CustomScrollView(
                                slivers: [
                                  SliverAppBar(
                                    floating: true,
                                    pinned: false,
                                    shape: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    backgroundColor: Colors.transparent,
                                    leading: BackButton(
                                      color: Colors.white,
                                      onPressed: widget.onClose,
                                    ),
                                    centerTitle: false,
                                    title: const Text(
                                      'Trung tâm thông báo',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        height: 1.2,
                                      ),
                                    ),
                                    elevation: 0,
                                  ),
                                  SliverPadding(
                                    padding: const EdgeInsets.all(16.0),
                                    sliver: SliverToBoxAdapter(
                                      child: TextFormField(
                                        cursorHeight: 20,
                                        cursorColor: Colors.white,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                        onChanged: (value) =>
                                            bloc.add(Search(value)),
                                        decoration: InputDecoration(
                                          hintText: 'Tìm kiếm',
                                          hintStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                          fillColor: const Color.fromRGBO(
                                              242, 242, 242, 0.24),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          prefixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const SizedBox(width: 16),
                                              ImageWidget(
                                                IconAppConstants.icSearch,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (!state.status.isSuccess)
                                    SliverPadding(
                                      padding: const EdgeInsets.all(16.0),
                                      sliver: SliverList.separated(
                                        itemBuilder: (context, index) =>
                                            const _CardSkeleton(),
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 8),
                                      ),
                                    ),
                                  if (state.status.isSuccess)
                                    SliverPadding(
                                      padding: const EdgeInsets.all(16.0),
                                      sliver: SliverList.separated(
                                        itemCount: state.items.length,
                                        itemBuilder: (context, index) =>
                                            NotificationCard(
                                                data: state.items[index]),
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 8),
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CardSkeleton extends StatelessWidget {
  const _CardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(247, 247, 247, 0.70),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoxSkeleton(
                  height: 19 * 2,
                  width: 19 * 2,
                  borderRadius: BorderRadius.circular(19),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: BoxSkeleton(
                      height: 14,
                      width: 100,
                    ),
                  ),
                ),
                const BoxSkeleton(
                  height: 14,
                  width: 100,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const BoxSkeleton(
            borderRadius: BorderRadius.zero,
            height: 10,
          ),
          const SizedBox(height: 4),
          const BoxSkeleton(
            borderRadius: BorderRadius.zero,
            height: 10,
          ),
          const SizedBox(height: 4),
          const BoxSkeleton(
            borderRadius: BorderRadius.zero,
            height: 10,
          ),
        ],
      ),
    );
  }
}

class _List extends StatelessWidget {
  const _List({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (ctx, state) {
        if (!state.status.isSuccess) {
          return const Center(child: PlatformLoadingIndicator(size: 30));
        }
        final bloc = ctx.read<NotificationBloc>();
        return SmartRefresher.builder(
          controller: bloc.controller,
          enablePullDown: true,
          enablePullUp: state.hasLoadMore,
          onRefresh: () => bloc.add(Fetch()),
          onLoading: () => bloc.add(LoadMore()),
          builder: (_, __) {
            List<NotificationData> items = state.items;
            if (state.isSearching) {
              items = state.search;
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (_, index) => NotificationCard(data: items[index]),
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemCount: items.length,
            );
          },
        );
      },
    );
  }
}
