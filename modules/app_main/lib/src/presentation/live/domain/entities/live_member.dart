import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class LiveMemberInfo extends Equatable {
  final int userID;
  final String name;
  final String avatar;
  final int type;

  const LiveMemberInfo({
    required this.userID,
    required this.name,
    required this.avatar,
    required this.type,
  });

  @override
  List<Object?> get props => [userID, name, avatar, type];
}

class LiveMember extends Equatable {
  final LiveMemberInfo info;
  final bool isOwner;
  final int liveID;

  const LiveMember({
    required this.info,
    this.isOwner = false,
    required this.liveID,
  });

  LiveMember copyWith({bool? isOwner}) {
    return LiveMember(
      info: info,
      isOwner: isOwner ?? this.isOwner,
      liveID: liveID,
    );
  }

  @override
  List<Object?> get props => [isOwner, info, liveID];
}
