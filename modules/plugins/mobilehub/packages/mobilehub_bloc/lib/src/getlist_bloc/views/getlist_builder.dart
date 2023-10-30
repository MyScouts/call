import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';

import '../bloc/get_list_bloc.dart';

class GetListBuilder<T> extends StatelessWidget {
  final Widget Function(BuildContext context, List<T> data) builder;
  final Widget Function()? loadingBuilder;

  const GetListBuilder({
    Key? key,
    required this.builder,
    this.loadingBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetListBloc<T>, GetListState>(
      builder: (context, state) {
        if (state is GetListDataLoading) {
          return loadingBuilder != null
              ? loadingBuilder!()
              : const LoadingWidget();
        } else if (state is GetListDataSuccess<T>) {
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

class GetListParam1Builder<T, P1> extends StatelessWidget {
  final Widget Function(BuildContext context, List<T> data) builder;
  final Widget Function()? initStateBuilder;

  const GetListParam1Builder({
    Key? key,
    required this.builder,
    this.initStateBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetListBlocParam1<T, P1>, GetListState>(
      builder: (context, state) {
        if (state is GetListDataLoading) {
          return const LoadingWidget();
        } else if (state is GetListDataSuccess<T>) {
          return AnimatedSize(
            duration: const Duration(milliseconds: 200),
            child: builder(context, state.data),
          );
        }

        return initStateBuilder != null
            ? initStateBuilder!()
            : const SizedBox();
      },
    );
  }
}

class GetListParam3Builder<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  final Widget Function(BuildContext context, S data) builder;
  final Widget Function(BuildContext context, S data)? builderError;
  final Widget Function()? initStateBuilder;
  final BlocWidgetListener<S>? listener;
  final bool useLoading;

  const GetListParam3Builder({
    Key? key,
    required this.builder,
    this.initStateBuilder,
    this.listener,
    this.builderError,
    this.useLoading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, S>(
      listener: (context, state) {
        listener?.call(context, state);
      },
      builder: (context, state) {
        if (state is GetListDataLoading) {
          if (useLoading) {
            return const LoadingWidget();
          }
          return AnimatedSize(
            duration: const Duration(milliseconds: 200),
            child: builder(context, state),
          );
        } else if (state is GetListDataSuccess) {
          return AnimatedSize(
            duration: const Duration(milliseconds: 200),
            child: builder(context, state),
          );
        } else if (state is GetListDataError) {
          if (builderError != null) {
            return builderError!(context, state);
          }
          return AnimatedSize(
            duration: const Duration(milliseconds: 200),
            child: builder(context, state),
          );
        }

        return initStateBuilder != null
            ? initStateBuilder!()
            : const SizedBox();
      },
    );
  }
}
