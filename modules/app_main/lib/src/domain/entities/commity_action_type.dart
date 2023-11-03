import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

enum PDoneActionType {
  registerPDone,
  registerJA,
  registerVShop,
}

extension PDoneActionTypeExt on PDoneActionType {
  String text(BuildContext context) {
    switch (this) {
      case PDoneActionType.registerPDone:
        return S.of(context).pdoneAction_registerPDone;
      case PDoneActionType.registerJA:
        return 'Đăng ký JA';
      case PDoneActionType.registerVShop:
        return S.of(context).pdoneAction_registerVShop;
    }
  }

  String name(BuildContext context) {
    switch (this) {
      case PDoneActionType.registerPDone:
        return 'PDone';
      case PDoneActionType.registerJA:
        return 'JA';
      case PDoneActionType.registerVShop:
        return 'VShop';
    }
  }
}
