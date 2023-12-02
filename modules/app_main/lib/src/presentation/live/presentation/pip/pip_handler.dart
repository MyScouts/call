import 'package:app_main/src/presentation/live/presentation/pip/pip_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class PipHandler {

  static final RxBool _showPip = false.obs;

  static RxBool get showPip => _showPip;

  static Widget pipView = const SizedBox.shrink();

  static PipView? _overlayView;

  static PipView? get overlayView => _overlayView;

  static void disablePip() {
    removeOverlay();
  }

  static void removeOverlay() {
    pipView = const SizedBox.shrink();
    _showPip.value = false;
  }

  static void addOverlay(PipView view) {
    pipView = view;
    _showPip.value = true;
  }
}
