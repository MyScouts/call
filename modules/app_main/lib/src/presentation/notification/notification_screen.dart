import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/loading_indicator/platform_loading.dart';
import 'package:app_main/src/domain/entities/notification/notification_data.dart';
import 'package:app_main/src/presentation/notification/state/notification_bloc.dart';
import 'package:app_main/src/presentation/notification/widget/notification_card.dart';
import 'package:auto_animated_list/auto_animated_list.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

import 'package:imagewidget/imagewidget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NotificationScreen extends StatefulWidget {
  static const String routerName = '/notification';

  const NotificationScreen({super.key, required this.onClose});

  final Function() onClose;

  @override
  State<NotificationScreen> createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late final bloc = context.read<NotificationBloc>();
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
    animation = Tween<Offset>(
      begin: Offset(0, -ScreenUtil().screenHeight),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  void forward() => controller.forward();

  void revert() => controller.reverse();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationBloc>.value(
      value: bloc,
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
                  appBar: AppBar(
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
                  body: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    behavior: HitTestBehavior.opaque,
                    child: BlocBuilder<NotificationBloc, NotificationState>(
                      builder: (ctx, state) {
                        final bloc = ctx.read<NotificationBloc>();

                        List<NotificationData> items = state.items;
                        if (state.isSearching) {
                          items = state.search;
                        }

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: TextFormField(
                                cursorHeight: 20,
                                cursorColor: Colors.white,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                onChanged: (value) => bloc.add(Search(value)),
                                decoration: InputDecoration(
                                  hintText: 'Tìm kiếm',
                                  hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  fillColor:
                                      const Color.fromRGBO(242, 242, 242, 0.24),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
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
                            Expanded(
                              child: SmartRefresher.builder(
                                controller: bloc.controller,
                                enablePullDown: true,
                                enablePullUp: state.hasLoadMore,
                                onRefresh: () => bloc.add(Fetch()),
                                onLoading: () => bloc.add(LoadMore()),
                                builder: (_, __) {
                                  if (!state.status.isSuccess) {
                                    return const Center(
                                      child: PlatformLoadingIndicator(),
                                    );
                                  }

                                  return AutoAnimatedList<NotificationData>(
                                    duration: const Duration(milliseconds: 150),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    items: items,
                                    itemBuilder: (_, item, i, animation) {
                                      return _SizeFadeTransition(
                                        animation: animation,
                                        child: NotificationCard(
                                          data: item,
                                          isSearching: state.isSearching,
                                          onRemoved: () {
                                            context
                                                .read<NotificationBloc>()
                                                .add(Delete(items[i].id));
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
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

class _SizeFadeTransition extends StatefulWidget {
  const _SizeFadeTransition({
    Key? key,
    required this.animation,
    required this.child,
  }) : super(key: key);

  final Animation<double> animation;

  final Widget child;

  @override
  State<_SizeFadeTransition> createState() => _SizeFadeTransitionState();
}

class _SizeFadeTransitionState extends State<_SizeFadeTransition> {
  late Animation<double> _size;

  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _handleAnimationUpdated();
  }

  @override
  void didUpdateWidget(_SizeFadeTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    _handleAnimationUpdated();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _size,
      child: FadeTransition(
        opacity: _opacity,
        child: widget.child,
      ),
    );
  }

  void _handleAnimationUpdated() {
    final curvedAnimation = CurvedAnimation(
      parent: widget.animation,
      curve: Curves.easeInOut,
    );
    _size = CurvedAnimation(
      curve: const Interval(0, 1.0),
      parent: curvedAnimation,
    );
    _opacity = CurvedAnimation(
      curve: const Interval(0, 1.0),
      parent: curvedAnimation,
    );
  }
}
