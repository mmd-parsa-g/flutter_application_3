import 'package:equatable/equatable.dart';

class ReceiveData extends Equatable {
  final int rank;
  final double latestRate;
  final double yesterdayPriceChangePercent;
  final String iconUrl;
  final bool isPin;
  final String pair;
  final int baseAssetDecimals;
  final String enName;

  const ReceiveData({
    required this.baseAssetDecimals,
    required this.enName,
    required this.pair,
    required this.rank,
    required this.latestRate,
    required this.yesterdayPriceChangePercent,
    required this.iconUrl,
    required this.isPin,
  });

  @override
  List<Object?> get props => [
        enName,
        baseAssetDecimals,
        pair,
        isPin,
        rank,
        latestRate,
        yesterdayPriceChangePercent,
        iconUrl,
      ];

  ReceiveData copyWith({
    String? enName,
    String? pair,
    bool? isPin,
    double? latestRate,
    int? rank,
    double? yesterdayPriceChangePercent,
    String? iconUrl,
    int? baseAssetDecimals,
  }) {
    return ReceiveData(
        enName: enName ?? this.enName,
        baseAssetDecimals: baseAssetDecimals ?? this.baseAssetDecimals,
        pair: pair ?? this.pair,
        latestRate: latestRate ?? this.latestRate,
        iconUrl: iconUrl ?? this.iconUrl,
        rank: rank ?? this.rank,
        yesterdayPriceChangePercent:
            yesterdayPriceChangePercent ?? this.yesterdayPriceChangePercent,
        isPin: isPin ?? this.isPin);
  }

  factory ReceiveData.fromJson(Map<String, dynamic> json) {
    return ReceiveData(
      enName: json['enName'],
      baseAssetDecimals: json['baseAssetDecimals'],
      pair: json['pair'],
      rank: json['rank'],
      iconUrl: json['iconUrl'],
      yesterdayPriceChangePercent: json['yesterdayPriceChangePercent'],
      latestRate: json['latestRate'],
      isPin: false,
    );
  }
}
