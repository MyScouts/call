import 'package:flutter/cupertino.dart';

enum PDoneOptionAge { under15, over15AndUnder18, over18 }

extension PDoneOptionAgeeExt on PDoneOptionAge {
  String title(BuildContext context) {
    switch (this) {
      case PDoneOptionAge.under15:
        return 'Dưới 15 tuổi';
      case PDoneOptionAge.over15AndUnder18:
        return 'Từ 15 đến 18 tuổi';
      case PDoneOptionAge.over18:
        return 'Trên 18 tuổi';
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