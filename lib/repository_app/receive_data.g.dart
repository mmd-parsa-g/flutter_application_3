// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiveDataImpl _$$ReceiveDataImplFromJson(Map<String, dynamic> json) =>
    _$ReceiveDataImpl(
      rank: (json['rank'] as num).toInt(),
      latestRate: (json['latestRate'] as num).toDouble(),
      yesterdayPriceChangePercent:
          (json['yesterdayPriceChangePercent'] as num).toDouble(),
      iconUrl: json['iconUrl'] as String,
      isPin: json['isPin'] as bool? ?? false,
      pair: json['pair'] as String,
      baseAssetDecimals: (json['baseAssetDecimals'] as num).toInt(),
    );

Map<String, dynamic> _$$ReceiveDataImplToJson(_$ReceiveDataImpl instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'latestRate': instance.latestRate,
      'yesterdayPriceChangePercent': instance.yesterdayPriceChangePercent,
      'iconUrl': instance.iconUrl,
      'isPin': instance.isPin,
      'pair': instance.pair,
      'baseAssetDecimals': instance.baseAssetDecimals,
    };
