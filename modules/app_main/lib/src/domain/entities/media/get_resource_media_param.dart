import 'package:equatable/equatable.dart';

import 'resource_media.dart';

class GetResourceMediaParam extends Equatable {
  final ResourceMedia resourceMedia;
  final ResourceRole role;

  const GetResourceMediaParam(this.resourceMedia, this.role);

  @override
  List<Object?> get props => [resourceMedia, role];
}
