import 'package:equatable/equatable.dart';

enum ResourceType {
  video,
  mp3,
  image,
  file,
}

extension ResourceTypeExt on ResourceType {
  bool get isImage => ResourceType.image == this;
}

class ResourceMedia extends Equatable {
  final ResourceType type;
  final String category;

  const ResourceMedia._(
    this.type,
    this.category,
  );

  const ResourceMedia.tivi() : this._(ResourceType.video, 'tv');

  const ResourceMedia.radio() : this._(ResourceType.mp3, 'radio');

  const ResourceMedia.image() : this._(ResourceType.image, 'banner');

  @override
  List<Object?> get props => [type, category];
}

enum ResourceRole {
  guess,
  user,
}
