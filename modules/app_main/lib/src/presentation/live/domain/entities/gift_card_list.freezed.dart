// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_card_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GiftCardList _$GiftCardListFromJson(Map<String, dynamic> json) {
  return _GiftCardList.fromJson(json);
}

/// @nodoc
mixin _$GiftCardList {
  @JsonKey(name: 'giftCards')
  List<GiftCard>? get giftList => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GiftCardListCopyWith<GiftCardList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftCardListCopyWith<$Res> {
  factory $GiftCardListCopyWith(
          GiftCardList value, $Res Function(GiftCardList) then) =
      _$GiftCardListCopyWithImpl<$Res, GiftCardList>;
  @useResult
  $Res call({@JsonKey(name: 'giftCards') List<GiftCard>? giftList, int? count});
}

/// @nodoc
class _$GiftCardListCopyWithImpl<$Res, $Val extends GiftCardList>
    implements $GiftCardListCopyWith<$Res> {
  _$GiftCardListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? giftList = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      giftList: freezed == giftList
          ? _value.giftList
          : giftList // ignore: cast_nullable_to_non_nullable
              as List<GiftCard>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GiftCardListImplCopyWith<$Res>
    implements $GiftCardListCopyWith<$Res> {
  factory _$$GiftCardListImplCopyWith(
          _$GiftCardListImpl value, $Res Function(_$GiftCardListImpl) then) =
      __$$GiftCardListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'giftCards') List<GiftCard>? giftList, int? count});
}

/// @nodoc
class __$$GiftCardListImplCopyWithImpl<$Res>
    extends _$GiftCardListCopyWithImpl<$Res, _$GiftCardListImpl>
    implements _$$GiftCardListImplCopyWith<$Res> {
  __$$GiftCardListImplCopyWithImpl(
      _$GiftCardListImpl _value, $Res Function(_$GiftCardListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? giftList = freezed,
    Object? count = freezed,
  }) {
    return _then(_$GiftCardListImpl(
      giftList: freezed == giftList
          ? _value._giftList
          : giftList // ignore: cast_nullable_to_non_nullable
              as List<GiftCard>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GiftCardListImpl implements _GiftCardList {
  const _$GiftCardListImpl(
      {@JsonKey(name: 'giftCards') final List<GiftCard>? giftList, this.count})
      : _giftList = giftList;

  factory _$GiftCardListImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiftCardListImplFromJson(json);

  final List<GiftCard>? _giftList;
  @override
  @JsonKey(name: 'giftCards')
  List<GiftCard>? get giftList {
    final value = _giftList;
    if (value == null) return null;
    if (_giftList is EqualUnmodifiableListView) return _giftList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? count;

  @override
  String toString() {
    return 'GiftCardList(giftList: $giftList, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftCardListImpl &&
            const DeepCollectionEquality().equals(other._giftList, _giftList) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_giftList), count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftCardListImplCopyWith<_$GiftCardListImpl> get copyWith =>
      __$$GiftCardListImplCopyWithImpl<_$GiftCardListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiftCardListImplToJson(
      this,
    );
  }
}

abstract class _GiftCardList implements GiftCardList {
  const factory _GiftCardList(
      {@JsonKey(name: 'giftCards') final List<GiftCard>? giftList,
      final int? count}) = _$GiftCardListImpl;

  factory _GiftCardList.fromJson(Map<String, dynamic> json) =
      _$GiftCardListImpl.fromJson;

  @override
  @JsonKey(name: 'giftCards')
  List<GiftCard>? get giftList;
  @override
  int? get count;
  @override
  @JsonKey(ignore: true)
  _$$GiftCardListImplCopyWith<_$GiftCardListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GiftCard _$GiftCardFromJson(Map<String, dynamic> json) {
  return _GiftCard.fromJson(json);
}

/// @nodoc
mixin _$GiftCard {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get imageGift => throw _privateConstructorUsedError;
  String? get gifUrl => throw _privateConstructorUsedError;
  int? get coinValue => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  int? get type => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  MetaData? get metadata => throw _privateConstructorUsedError;
  dynamic get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GiftCardCopyWith<GiftCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftCardCopyWith<$Res> {
  factory $GiftCardCopyWith(GiftCard value, $Res Function(GiftCard) then) =
      _$GiftCardCopyWithImpl<$Res, GiftCard>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? imageGift,
      String? gifUrl,
      int? coinValue,
      int? status,
      int? type,
      String? createdAt,
      String? updatedAt,
      MetaData? metadata,
      dynamic deletedAt});

  $MetaDataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$GiftCardCopyWithImpl<$Res, $Val extends GiftCard>
    implements $GiftCardCopyWith<$Res> {
  _$GiftCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageGift = freezed,
    Object? gifUrl = freezed,
    Object? coinValue = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? metadata = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageGift: freezed == imageGift
          ? _value.imageGift
          : imageGift // ignore: cast_nullable_to_non_nullable
              as String?,
      gifUrl: freezed == gifUrl
          ? _value.gifUrl
          : gifUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coinValue: freezed == coinValue
          ? _value.coinValue
          : coinValue // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as MetaData?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaDataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $MetaDataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GiftCardImplCopyWith<$Res>
    implements $GiftCardCopyWith<$Res> {
  factory _$$GiftCardImplCopyWith(
          _$GiftCardImpl value, $Res Function(_$GiftCardImpl) then) =
      __$$GiftCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? imageGift,
      String? gifUrl,
      int? coinValue,
      int? status,
      int? type,
      String? createdAt,
      String? updatedAt,
      MetaData? metadata,
      dynamic deletedAt});

  @override
  $MetaDataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$GiftCardImplCopyWithImpl<$Res>
    extends _$GiftCardCopyWithImpl<$Res, _$GiftCardImpl>
    implements _$$GiftCardImplCopyWith<$Res> {
  __$$GiftCardImplCopyWithImpl(
      _$GiftCardImpl _value, $Res Function(_$GiftCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageGift = freezed,
    Object? gifUrl = freezed,
    Object? coinValue = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? metadata = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_$GiftCardImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageGift: freezed == imageGift
          ? _value.imageGift
          : imageGift // ignore: cast_nullable_to_non_nullable
              as String?,
      gifUrl: freezed == gifUrl
          ? _value.gifUrl
          : gifUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coinValue: freezed == coinValue
          ? _value.coinValue
          : coinValue // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as MetaData?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GiftCardImpl implements _GiftCard {
  const _$GiftCardImpl(
      {this.id,
      this.name,
      this.imageGift,
      this.gifUrl,
      this.coinValue,
      this.status,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.metadata,
      this.deletedAt});

  factory _$GiftCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiftCardImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? imageGift;
  @override
  final String? gifUrl;
  @override
  final int? coinValue;
  @override
  final int? status;
  @override
  final int? type;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final MetaData? metadata;
  @override
  final dynamic deletedAt;

  @override
  String toString() {
    return 'GiftCard(id: $id, name: $name, imageGift: $imageGift, gifUrl: $gifUrl, coinValue: $coinValue, status: $status, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, metadata: $metadata, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageGift, imageGift) ||
                other.imageGift == imageGift) &&
            (identical(other.gifUrl, gifUrl) || other.gifUrl == gifUrl) &&
            (identical(other.coinValue, coinValue) ||
                other.coinValue == coinValue) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      imageGift,
      gifUrl,
      coinValue,
      status,
      type,
      createdAt,
      updatedAt,
      metadata,
      const DeepCollectionEquality().hash(deletedAt));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftCardImplCopyWith<_$GiftCardImpl> get copyWith =>
      __$$GiftCardImplCopyWithImpl<_$GiftCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiftCardImplToJson(
      this,
    );
  }
}

abstract class _GiftCard implements GiftCard {
  const factory _GiftCard(
      {final int? id,
      final String? name,
      final String? imageGift,
      final String? gifUrl,
      final int? coinValue,
      final int? status,
      final int? type,
      final String? createdAt,
      final String? updatedAt,
      final MetaData? metadata,
      final dynamic deletedAt}) = _$GiftCardImpl;

  factory _GiftCard.fromJson(Map<String, dynamic> json) =
      _$GiftCardImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get imageGift;
  @override
  String? get gifUrl;
  @override
  int? get coinValue;
  @override
  int? get status;
  @override
  int? get type;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  MetaData? get metadata;
  @override
  dynamic get deletedAt;
  @override
  @JsonKey(ignore: true)
  _$$GiftCardImplCopyWith<_$GiftCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetaData _$MetaDataFromJson(Map<String, dynamic> json) {
  return _MetaData.fromJson(json);
}

/// @nodoc
mixin _$MetaData {
  bool? get isStaticGif => throw _privateConstructorUsedError;
  dynamic get displayTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaDataCopyWith<MetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaDataCopyWith<$Res> {
  factory $MetaDataCopyWith(MetaData value, $Res Function(MetaData) then) =
      _$MetaDataCopyWithImpl<$Res, MetaData>;
  @useResult
  $Res call({bool? isStaticGif, dynamic displayTime});
}

/// @nodoc
class _$MetaDataCopyWithImpl<$Res, $Val extends MetaData>
    implements $MetaDataCopyWith<$Res> {
  _$MetaDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isStaticGif = freezed,
    Object? displayTime = freezed,
  }) {
    return _then(_value.copyWith(
      isStaticGif: freezed == isStaticGif
          ? _value.isStaticGif
          : isStaticGif // ignore: cast_nullable_to_non_nullable
              as bool?,
      displayTime: freezed == displayTime
          ? _value.displayTime
          : displayTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaDataImplCopyWith<$Res>
    implements $MetaDataCopyWith<$Res> {
  factory _$$MetaDataImplCopyWith(
          _$MetaDataImpl value, $Res Function(_$MetaDataImpl) then) =
      __$$MetaDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isStaticGif, dynamic displayTime});
}

/// @nodoc
class __$$MetaDataImplCopyWithImpl<$Res>
    extends _$MetaDataCopyWithImpl<$Res, _$MetaDataImpl>
    implements _$$MetaDataImplCopyWith<$Res> {
  __$$MetaDataImplCopyWithImpl(
      _$MetaDataImpl _value, $Res Function(_$MetaDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isStaticGif = freezed,
    Object? displayTime = freezed,
  }) {
    return _then(_$MetaDataImpl(
      isStaticGif: freezed == isStaticGif
          ? _value.isStaticGif
          : isStaticGif // ignore: cast_nullable_to_non_nullable
              as bool?,
      displayTime: freezed == displayTime
          ? _value.displayTime
          : displayTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaDataImpl implements _MetaData {
  const _$MetaDataImpl({this.isStaticGif, this.displayTime = 4});

  factory _$MetaDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaDataImplFromJson(json);

  @override
  final bool? isStaticGif;
  @override
  @JsonKey()
  final dynamic displayTime;

  @override
  String toString() {
    return 'MetaData(isStaticGif: $isStaticGif, displayTime: $displayTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaDataImpl &&
            (identical(other.isStaticGif, isStaticGif) ||
                other.isStaticGif == isStaticGif) &&
            const DeepCollectionEquality()
                .equals(other.displayTime, displayTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isStaticGif,
      const DeepCollectionEquality().hash(displayTime));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaDataImplCopyWith<_$MetaDataImpl> get copyWith =>
      __$$MetaDataImplCopyWithImpl<_$MetaDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaDataImplToJson(
      this,
    );
  }
}

abstract class _MetaData implements MetaData {
  const factory _MetaData(
      {final bool? isStaticGif, final dynamic displayTime}) = _$MetaDataImpl;

  factory _MetaData.fromJson(Map<String, dynamic> json) =
      _$MetaDataImpl.fromJson;

  @override
  bool? get isStaticGif;
  @override
  dynamic get displayTime;
  @override
  @JsonKey(ignore: true)
  _$$MetaDataImplCopyWith<_$MetaDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
