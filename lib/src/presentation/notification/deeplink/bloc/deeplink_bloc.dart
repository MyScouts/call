import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'deeplink_event.dart';
part 'deeplink_state.dart';

@injectable
class DeeplinkBloc extends Bloc<DeeplinkEvent, DeeplinkState> {
  DeeplinkBloc() : super(DeeplinkInitial()) {
    on<OpenLinkEvent>(_onOpenLinkEvent);
  }

  FutureOr<void> _onOpenLinkEvent(
      OpenLinkEvent event, Emitter<DeeplinkState> emit) {
    final link = event.url;
    if (link.isNotEmpty) {
      emit(DeeplinkOpend(link));
    }
  }
}
