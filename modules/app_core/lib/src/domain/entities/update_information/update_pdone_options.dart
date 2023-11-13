import 'package:flutter/cupertino.dart';

enum PDoneOptionAge { under14, over15 }
enum PDoneAPICaller { adult, teenager, children }

extension PDoneOptionAgeeExt on PDoneOptionAge {
  String title(BuildContext context) {
    switch (this) {
      case PDoneOptionAge.under14:
        return 'Dưới 14 tuổi';
      case PDoneOptionAge.over15:
        return 'Trên 15 tuổi';
    }
  }
}


enum PDoneOptionMethod {
  userBirthCer,
  userIdentityCard,
}


extension PDoneOptionMethodExt on PDoneOptionMethod {
  String title(BuildContext context) {
    switch (this) {
      case PDoneOptionMethod.userBirthCer:
        return 'Sử dụng giấy khai sinh';
      case PDoneOptionMethod.userIdentityCard:
        return 'Sử dụng CCCD';
    }
  }
}