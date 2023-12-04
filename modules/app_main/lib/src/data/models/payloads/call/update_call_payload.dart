class UpdateCallPayload {
  final int type;
  final int status;

  UpdateCallPayload({required this.type, this.status = 2});

  factory UpdateCallPayload.fromJson(Map<String, dynamic> json) => UpdateCallPayload(
        type: json['type'] as int,
        status: json['status'] as int,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'status': status,
      };
}
