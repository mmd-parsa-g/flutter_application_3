// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receive_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReceiveData _$ReceiveDataFromJson(Map<String, dynamic> json) {
  return _ReceiveData.fromJson(json);
}

/// @nodoc
mixin _$ReceiveData {
  int get rank => throw _privateConstructorUsedError;
  double get latestRate => throw _privateConstructorUsedError;
  double get yesterdayPriceChangePercent => throw _privateConstructorUsedError;
  String get iconUrl => throw _privateConstructorUsedError;
  bool get isPin => throw _privateConstructorUsedError;
  String get pair => throw _privateConstructorUsedError;
  int get baseAssetDecimals => throw _privateConstructorUsedError;

  /// Serializes this ReceiveData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReceiveData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiveDataCopyWith<ReceiveData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiveDataCopyWith<$Res> {
  factory $ReceiveDataCopyWith(
          ReceiveData value, $Res Function(ReceiveData) then) =
      _$ReceiveDataCopyWithImpl<$Res, ReceiveData>;
  @useResult
  $Res call(
      {int rank,
      double latestRate,
      double yesterdayPriceChangePercent,
      String iconUrl,
      bool isPin,
      String pair,
      int baseAssetDecimals});
}

/// @nodoc
class _$ReceiveDataCopyWithImpl<$Res, $Val extends ReceiveData>
    implements $ReceiveDataCopyWith<$Res> {
  _$ReceiveDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceiveData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? latestRate = null,
    Object? yesterdayPriceChangePercent = null,
    Object? iconUrl = null,
    Object? isPin = null,
    Object? pair = null,
    Object? baseAssetDecimals = null,
  }) {
    return _then(_value.copyWith(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      latestRate: null == latestRate
          ? _value.latestRate
          : latestRate // ignore: cast_nullable_to_non_nullable
              as double,
      yesterdayPriceChangePercent: null == yesterdayPriceChangePercent
          ? _value.yesterdayPriceChangePercent
          : yesterdayPriceChangePercent // ignore: cast_nullable_to_non_nullable
              as double,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isPin: null == isPin
          ? _value.isPin
          : isPin // ignore: cast_nullable_to_non_nullable
              as bool,
      pair: null == pair
          ? _value.pair
          : pair // ignore: cast_nullable_to_non_nullable
              as String,
      baseAssetDecimals: null == baseAssetDecimals
          ? _value.baseAssetDecimals
          : baseAssetDecimals // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiveDataImplCopyWith<$Res>
    implements $ReceiveDataCopyWith<$Res> {
  factory _$$ReceiveDataImplCopyWith(
          _$ReceiveDataImpl value, $Res Function(_$ReceiveDataImpl) then) =
      __$$ReceiveDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int rank,
      double latestRate,
      double yesterdayPriceChangePercent,
      String iconUrl,
      bool isPin,
      String pair,
      int baseAssetDecimals});
}

/// @nodoc
class __$$ReceiveDataImplCopyWithImpl<$Res>
    extends _$ReceiveDataCopyWithImpl<$Res, _$ReceiveDataImpl>
    implements _$$ReceiveDataImplCopyWith<$Res> {
  __$$ReceiveDataImplCopyWithImpl(
      _$ReceiveDataImpl _value, $Res Function(_$ReceiveDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiveData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? latestRate = null,
    Object? yesterdayPriceChangePercent = null,
    Object? iconUrl = null,
    Object? isPin = null,
    Object? pair = null,
    Object? baseAssetDecimals = null,
  }) {
    return _then(_$ReceiveDataImpl(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      latestRate: null == latestRate
          ? _value.latestRate
          : latestRate // ignore: cast_nullable_to_non_nullable
              as double,
      yesterdayPriceChangePercent: null == yesterdayPriceChangePercent
          ? _value.yesterdayPriceChangePercent
          : yesterdayPriceChangePercent // ignore: cast_nullable_to_non_nullable
              as double,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isPin: null == isPin
          ? _value.isPin
          : isPin // ignore: cast_nullable_to_non_nullable
              as bool,
      pair: null == pair
          ? _value.pair
          : pair // ignore: cast_nullable_to_non_nullable
              as String,
      baseAssetDecimals: null == baseAssetDecimals
          ? _value.baseAssetDecimals
          : baseAssetDecimals // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceiveDataImpl implements _ReceiveData {
  const _$ReceiveDataImpl(
      {required this.rank,
      required this.latestRate,
      required this.yesterdayPriceChangePercent,
      required this.iconUrl,
      this.isPin = false,
      required this.pair,
      required this.baseAssetDecimals});

  factory _$ReceiveDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiveDataImplFromJson(json);

  @override
  final int rank;
  @override
  final double latestRate;
  @override
  final double yesterdayPriceChangePercent;
  @override
  final String iconUrl;
  @override
  @JsonKey()
  final bool isPin;
  @override
  final String pair;
  @override
  final int baseAssetDecimals;

  @override
  String toString() {
    return 'ReceiveData(rank: $rank, latestRate: $latestRate, yesterdayPriceChangePercent: $yesterdayPriceChangePercent, iconUrl: $iconUrl, isPin: $isPin, pair: $pair, baseAssetDecimals: $baseAssetDecimals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveDataImpl &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.latestRate, latestRate) ||
                other.latestRate == latestRate) &&
            (identical(other.yesterdayPriceChangePercent,
                    yesterdayPriceChangePercent) ||
                other.yesterdayPriceChangePercent ==
                    yesterdayPriceChangePercent) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.isPin, isPin) || other.isPin == isPin) &&
            (identical(other.pair, pair) || other.pair == pair) &&
            (identical(other.baseAssetDecimals, baseAssetDecimals) ||
                other.baseAssetDecimals == baseAssetDecimals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rank, latestRate,
      yesterdayPriceChangePercent, iconUrl, isPin, pair, baseAssetDecimals);

  /// Create a copy of ReceiveData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveDataImplCopyWith<_$ReceiveDataImpl> get copyWith =>
      __$$ReceiveDataImplCopyWithImpl<_$ReceiveDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiveDataImplToJson(
      this,
    );
  }
}

abstract class _ReceiveData implements ReceiveData {
  const factory _ReceiveData(
      {required final int rank,
      required final double latestRate,
      required final double yesterdayPriceChangePercent,
      required final String iconUrl,
      final bool isPin,
      required final String pair,
      required final int baseAssetDecimals}) = _$ReceiveDataImpl;

  factory _ReceiveData.fromJson(Map<String, dynamic> json) =
      _$ReceiveDataImpl.fromJson;

  @override
  int get rank;
  @override
  double get latestRate;
  @override
  double get yesterdayPriceChangePercent;
  @override
  String get iconUrl;
  @override
  bool get isPin;
  @override
  String get pair;
  @override
  int get baseAssetDecimals;

  /// Create a copy of ReceiveData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiveDataImplCopyWith<_$ReceiveDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
