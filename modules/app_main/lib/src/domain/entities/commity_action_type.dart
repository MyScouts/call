import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

enum PDoneActionType {
  registerPDone,
  registerJA,
}

extension PDoneActionTypeExt on PDoneActionType {
  String text(BuildContext context) {
    switch (this) {
      case PDoneActionType.registerPDone:
        return S.of(context).pdoneAction_registerPDone;
      case PDoneActionType.registerJA:
        return 'Đăng ký JA';
    }
  }

  String name(BuildContext context) {
    switch (this) {
      case PDoneActionType.registerPDone:
        return 'PDone';
      case PDoneActionType.registerJA:
        return 'JA';
    }
  }
}
