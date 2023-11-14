import 'package:flutter/cupertino.dart';

enum PDoneOptionAge { over14, under15 }
enum PDoneAPICaller { adult, teenager, children }

extension PDoneOptionAgeeExt on PDoneOptionAge {
  String title(BuildContext context) {
    switch (this) {
      case PDoneOptionAge.over14:
        return 'Trên 14 tuổi';
      case PDoneOptionAge.under15:
        return 'Dưới 15 tuổi';
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