import 'package:equatable/equatable.dart';

class LiveMemberInfo extends Equatable {
  final int userID;
  final String name;
  final String avatar;

  const LiveMemberInfo({
    required this.userID,
    required this.name,
    required this.avatar,
  });

  @override
  List<Object?> get props => [userID, name, avatar];
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
