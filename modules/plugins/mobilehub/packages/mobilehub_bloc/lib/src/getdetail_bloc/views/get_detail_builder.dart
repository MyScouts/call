import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';

import '../bloc/get_detail_bloc.dart';

class GetDetailBuilder<T> extends StatelessWidget {
  final Widget Function(BuildContext context, T data) builder;

  const GetDetailBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDetailBloc<T>, GetDetailState>(
      builder: (context, state) {
        if (state is GetDetailDataLoading<T>) {
          return const LoadingWidget();
        } else if (state is GetDetailDataSuccess<T>) {
          return AnimatedSize(
            duration: const Duration(milliseconds: 200),
            child: builder(context, state.data),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class GetDetailBuilderParam1<T, P1> extends StatelessWidget {
  final Widget Function(BuildContext context, T data) builder;
  final Widget? errorWidget;
  final Widget? loadingWidget;
  final bool useAnimation;

  const GetDetailBuilderParam1({
    Key? key,
    required this.builder,
    this.errorWidget,
    this.loadingWidget,
    this.useAnimation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDetailBlocParam1<T, P1>, GetDetailState>(
      builder: (context, state) {
        if (state is GetDetailDataLoading<T>) {
          return loadingWidget ?? const LoadingWidget();
        } else if (state is GetDetailDataSuccess<T>) {
          return useAnimation
              ? AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  child: builder(context, state.data),
                )
              : builder(context, state.data);
        } else if (state is GetDetailError) {
          return errorWidget ?? const SizedBox();
        }
        return const SizedBox();
      },
    );
  }
}
