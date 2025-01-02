import 'package:freezed_annotation/freezed_annotation.dart';

part 'receive_data.freezed.dart';
part 'receive_data.g.dart';


@freezed
class ReceiveData with _$ReceiveData {
  const factory ReceiveData({
    required int rank,
    required double latestRate,
    required double yesterdayPriceChangePercent,
    required String iconUrl,
    @Default(false) bool isPin,
    required String pair,
    required int baseAssetDecimals,
    
  }) = _ReceiveData;

  factory ReceiveData.fromJson(Map<String, dynamic> json) =>
      _$ReceiveDataFromJson(json);
}
