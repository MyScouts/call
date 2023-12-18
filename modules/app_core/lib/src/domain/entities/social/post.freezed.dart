// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  int? get id => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get typeScope => throw _privateConstructorUsedError;
  int? get isNews => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;
  bool? get isAdvertisement => throw _privateConstructorUsedError;
  DateTime? get startPublishedDate => throw _privateConstructorUsedError;
  DateTime? get endPublishedDate => throw _privateConstructorUsedError;
  int? get position => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  int? get totalShared => throw _privateConstructorUsedError;
  int? get totalReaction => throw _privateConstructorUsedError;
  int? get totalSaved => throw _privateConstructorUsedError;
  bool? get isHearted => throw _privateConstructorUsedError;
  bool? get isSaved => throw _privateConstructorUsedError;
  bool? get isShared => throw _privateConstructorUsedError;
  int? get totalComment => throw _privateConstructorUsedError;
  int? get totalParentComment => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  List<Media>? get medias => throw _privateConstructorUsedError;
  Comment? get latestComment => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {int? id,
      int? userId,
      String? subject,
      String? content,
      String? typeScope,
      int? isNews,
      int? parentId,
      bool? isAdvertisement,
      DateTime? startPublishedDate,
      DateTime? endPublishedDate,
      int? position,
      DateTime? createdAt,
      int? totalShared,
      int? totalReaction,
      int? totalSaved,
      bool? isHearted,
      bool? isSaved,
      bool? isShared,
      int? totalComment,
      int? totalParentComment,
      User? user,
      List<Media>? medias,
      Comment? latestComment,
      String? type});

  $UserCopyWith<$Res>? get user;
  $CommentCopyWith<$Res>? get latestComment;
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? subject = freezed,
    Object? content = freezed,
    Object? typeScope = freezed,
    Object? isNews = freezed,
    Object? parentId = freezed,
    Object? isAdvertisement = freezed,
    Object? startPublishedDate = freezed,
    Object? endPublishedDate = freezed,
    Object? position = freezed,
    Object? createdAt = freezed,
    Object? totalShared = freezed,
    Object? totalReaction = freezed,
    Object? totalSaved = freezed,
    Object? isHearted = freezed,
    Object? isSaved = freezed,
    Object? isShared = freezed,
    Object? totalComment = freezed,
    Object? totalParentComment = freezed,
    Object? user = freezed,
    Object? medias = freezed,
    Object? latestComment = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      typeScope: freezed == typeScope
          ? _value.typeScope
          : typeScope // ignore: cast_nullable_to_non_nullable
              as String?,
      isNews: freezed == isNews
          ? _value.isNews
          : isNews // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      isAdvertisement: freezed == isAdvertisement
          ? _value.isAdvertisement
          : isAdvertisement // ignore: cast_nullable_to_non_nullable
              as bool?,
      startPublishedDate: freezed == startPublishedDate
          ? _value.startPublishedDate
          : startPublishedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endPublishedDate: freezed == endPublishedDate
          ? _value.endPublishedDate
          : endPublishedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalShared: freezed == totalShared
          ? _value.totalShared
          : totalShared // ignore: cast_nullable_to_non_nullable
              as int?,
      totalReaction: freezed == totalReaction
          ? _value.totalReaction
          : totalReaction // ignore: cast_nullable_to_non_nullable
              as int?,
      totalSaved: freezed == totalSaved
          ? _value.totalSaved
          : totalSaved // ignore: cast_nullable_to_non_nullable
              as int?,
      isHearted: freezed == isHearted
          ? _value.isHearted
          : isHearted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSaved: freezed == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      isShared: freezed == isShared
          ? _value.isShared
          : isShared // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalComment: freezed == totalComment
          ? _value.totalComment
          : totalComment // ignore: cast_nullable_to_non_nullable
              as int?,
      totalParentComment: freezed == totalParentComment
          ? _value.totalParentComment
          : totalParentComment // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      medias: freezed == medias
          ? _value.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<Media>?,
      latestComment: freezed == latestComment
          ? _value.latestComment
          : latestComment // ignore: cast_nullable_to_non_nullable
              as Comment?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentCopyWith<$Res>? get latestComment {
    if (_value.latestComment == null) {
      return null;
    }

    return $CommentCopyWith<$Res>(_value.latestComment!, (value) {
      return _then(_value.copyWith(latestComment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? userId,
      String? subject,
      String? content,
      String? typeScope,
      int? isNews,
      int? parentId,
      bool? isAdvertisement,
      DateTime? startPublishedDate,
      DateTime? endPublishedDate,
      int? position,
      DateTime? createdAt,
      int? totalShared,
      int? totalReaction,
      int? totalSaved,
      bool? isHearted,
      bool? isSaved,
      bool? isShared,
      int? totalComment,
      int? totalParentComment,
      User? user,
      List<Media>? medias,
      Comment? latestComment,
      String? type});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $CommentCopyWith<$Res>? get latestComment;
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? subject = freezed,
    Object? content = freezed,
    Object? typeScope = freezed,
    Object? isNews = freezed,
    Object? parentId = freezed,
    Object? isAdvertisement = freezed,
    Object? startPublishedDate = freezed,
    Object? endPublishedDate = freezed,
    Object? position = freezed,
    Object? createdAt = freezed,
    Object? totalShared = freezed,
    Object? totalReaction = freezed,
    Object? totalSaved = freezed,
    Object? isHearted = freezed,
    Object? isSaved = freezed,
    Object? isShared = freezed,
    Object? totalComment = freezed,
    Object? totalParentComment = freezed,
    Object? user = freezed,
    Object? medias = freezed,
    Object? latestComment = freezed,
    Object? type = freezed,
  }) {
    return _then(_$PostImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      typeScope: freezed == typeScope
          ? _value.typeScope
          : typeScope // ignore: cast_nullable_to_non_nullable
              as String?,
      isNews: freezed == isNews
          ? _value.isNews
          : isNews // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      isAdvertisement: freezed == isAdvertisement
          ? _value.isAdvertisement
          : isAdvertisement // ignore: cast_nullable_to_non_nullable
              as bool?,
      startPublishedDate: freezed == startPublishedDate
          ? _value.startPublishedDate
          : startPublishedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endPublishedDate: freezed == endPublishedDate
          ? _value.endPublishedDate
          : endPublishedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalShared: freezed == totalShared
          ? _value.totalShared
          : totalShared // ignore: cast_nullable_to_non_nullable
              as int?,
      totalReaction: freezed == totalReaction
          ? _value.totalReaction
          : totalReaction // ignore: cast_nullable_to_non_nullable
              as int?,
      totalSaved: freezed == totalSaved
          ? _value.totalSaved
          : totalSaved // ignore: cast_nullable_to_non_nullable
              as int?,
      isHearted: freezed == isHearted
          ? _value.isHearted
          : isHearted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSaved: freezed == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      isShared: freezed == isShared
          ? _value.isShared
          : isShared // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalComment: freezed == totalComment
          ? _value.totalComment
          : totalComment // ignore: cast_nullable_to_non_nullable
              as int?,
      totalParentComment: freezed == totalParentComment
          ? _value.totalParentComment
          : totalParentComment // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      medias: freezed == medias
          ? _value._medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<Media>?,
      latestComment: freezed == latestComment
          ? _value.latestComment
          : latestComment // ignore: cast_nullable_to_non_nullable
              as Comment?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {this.id,
      this.userId,
      this.subject,
      this.content,
      this.typeScope,
      this.isNews,
      this.parentId,
      this.isAdvertisement,
      this.startPublishedDate,
      this.endPublishedDate,
      this.position,
      this.createdAt,
      this.totalShared,
      this.totalReaction,
      this.totalSaved,
      this.isHearted,
      this.isSaved,
      this.isShared,
      this.totalComment,
      this.totalParentComment,
      this.user,
      final List<Media>? medias,
      this.latestComment,
      this.type})
      : _medias = medias;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  final int? id;
  @override
  final int? userId;
  @override
  final String? subject;
  @override
  final String? content;
  @override
  final String? typeScope;
  @override
  final int? isNews;
  @override
  final int? parentId;
  @override
  final bool? isAdvertisement;
  @override
  final DateTime? startPublishedDate;
  @override
  final DateTime? endPublishedDate;
  @override
  final int? position;
  @override
  final DateTime? createdAt;
  @override
  final int? totalShared;
  @override
  final int? totalReaction;
  @override
  final int? totalSaved;
  @override
  final bool? isHearted;
  @override
  final bool? isSaved;
  @override
  final bool? isShared;
  @override
  final int? totalComment;
  @override
  final int? totalParentComment;
  @override
  final User? user;
  final List<Media>? _medias;
  @override
  List<Media>? get medias {
    final value = _medias;
    if (value == null) return null;
    if (_medias is EqualUnmodifiableListView) return _medias;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Comment? latestComment;
  @override
  final String? type;

  @override
  String toString() {
    return 'Post(id: $id, userId: $userId, subject: $subject, content: $content, typeScope: $typeScope, isNews: $isNews, parentId: $parentId, isAdvertisement: $isAdvertisement, startPublishedDate: $startPublishedDate, endPublishedDate: $endPublishedDate, position: $position, createdAt: $createdAt, totalShared: $totalShared, totalReaction: $totalReaction, totalSaved: $totalSaved, isHearted: $isHearted, isSaved: $isSaved, isShared: $isShared, totalComment: $totalComment, totalParentComment: $totalParentComment, user: $user, medias: $medias, latestComment: $latestComment, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.typeScope, typeScope) ||
                other.typeScope == typeScope) &&
            (identical(other.isNews, isNews) || other.isNews == isNews) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.isAdvertisement, isAdvertisement) ||
                other.isAdvertisement == isAdvertisement) &&
            (identical(other.startPublishedDate, startPublishedDate) ||
                other.startPublishedDate == startPublishedDate) &&
            (identical(other.endPublishedDate, endPublishedDate) ||
                other.endPublishedDate == endPublishedDate) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.totalShared, totalShared) ||
                other.totalShared == totalShared) &&
            (identical(other.totalReaction, totalReaction) ||
                other.totalReaction == totalReaction) &&
            (identical(other.totalSaved, totalSaved) ||
                other.totalSaved == totalSaved) &&
            (identical(other.isHearted, isHearted) ||
                other.isHearted == isHearted) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.isShared, isShared) ||
                other.isShared == isShared) &&
            (identical(other.totalComment, totalComment) ||
                other.totalComment == totalComment) &&
            (identical(other.totalParentComment, totalParentComment) ||
                other.totalParentComment == totalParentComment) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._medias, _medias) &&
            (identical(other.latestComment, latestComment) ||
                other.latestComment == latestComment) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        subject,
        content,
        typeScope,
        isNews,
        parentId,
        isAdvertisement,
        startPublishedDate,
        endPublishedDate,
        position,
        createdAt,
        totalShared,
        totalReaction,
        totalSaved,
        isHearted,
        isSaved,
        isShared,
        totalComment,
        totalParentComment,
        user,
        const DeepCollectionEquality().hash(_medias),
        latestComment,
        type
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {final int? id,
      final int? userId,
      final String? subject,
      final String? content,
      final String? typeScope,
      final int? isNews,
      final int? parentId,
      final bool? isAdvertisement,
      final DateTime? startPublishedDate,
      final DateTime? endPublishedDate,
      final int? position,
      final DateTime? createdAt,
      final int? totalShared,
      final int? totalReaction,
      final int? totalSaved,
      final bool? isHearted,
      final bool? isSaved,
      final bool? isShared,
      final int? totalComment,
      final int? totalParentComment,
      final User? user,
      final List<Media>? medias,
      final Comment? latestComment,
      final String? type}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  int? get id;
  @override
  int? get userId;
  @override
  String? get subject;
  @override
  String? get content;
  @override
  String? get typeScope;
  @override
  int? get isNews;
  @override
  int? get parentId;
  @override
  bool? get isAdvertisement;
  @override
  DateTime? get startPublishedDate;
  @override
  DateTime? get endPublishedDate;
  @override
  int? get position;
  @override
  DateTime? get createdAt;
  @override
  int? get totalShared;
  @override
  int? get totalReaction;
  @override
  int? get totalSaved;
  @override
  bool? get isHearted;
  @override
  bool? get isSaved;
  @override
  bool? get isShared;
  @override
  int? get totalComment;
  @override
  int? get totalParentComment;
  @override
  User? get user;
  @override
  List<Media>? get medias;
  @override
  Comment? get latestComment;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
