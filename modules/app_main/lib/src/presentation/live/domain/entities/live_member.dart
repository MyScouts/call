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

  const LiveMember({
    required this.info,
    this.isOwner = false,
  });

  LiveMember copyWith({bool? isOwner}) {
    return LiveMember(
      info: info,
      isOwner: isOwner ?? this.isOwner,
    );
  }

  @override
  List<Object?> get props => [isOwner, info];
}
