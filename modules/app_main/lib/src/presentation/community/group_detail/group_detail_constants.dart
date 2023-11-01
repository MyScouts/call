import 'package:flutter/material.dart';

enum GroupDetailAction { edit }

extension GroupDetailActionExt on GroupDetailAction {
  String getText(BuildContext context) {
    switch (this) {
      case GroupDetailAction.edit:
        return 'Chỉnh sửa thông tin';
    }
  }
}
