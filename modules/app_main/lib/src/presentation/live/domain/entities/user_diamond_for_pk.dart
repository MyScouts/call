class UserDiamondForPK {
  final int userId;
  final int diamondCount;

  UserDiamondForPK({
    required this.userId,
    required this.diamondCount,
  });

  factory UserDiamondForPK.fromJson(Map<String, dynamic> json) {
    return UserDiamondForPK(
      userId: json['userId'],
      diamondCount: json['diamondCount'],
    );
  }

  UserDiamondForPK copyWith({int? diamondCount}) {
    return UserDiamondForPK(
      userId: userId,
      diamondCount: diamondCount ?? this.diamondCount,
    );
  }
}
