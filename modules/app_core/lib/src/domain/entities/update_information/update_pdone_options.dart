import 'package:flutter/cupertino.dart';

enum PDoneOptionAge { under15, over15 }
enum PDoneOptionRangeAge { over18, under18AndOver15 }

extension PDoneOptionAgeeExt on PDoneOptionAge {
  String title(BuildContext context) {
    switch (this) {
      case PDoneOptionAge.under15:
        return 'Dưới 15 tuổi';
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