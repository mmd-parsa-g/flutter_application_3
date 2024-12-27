import 'package:equatable/equatable.dart';

class ReceiveData extends Equatable {
  final String idName;
  final double price;
  final bool isPin;

  const ReceiveData({
    required this.idName,
    required this.price,
    required this.isPin,
  });

  @override
  List<Object?> get props => [idName, isPin, price];

  ReceiveData copyWith({
    bool? isPin,
    double? price,
    String? idName,
  }) {
    return ReceiveData(
        idName: idName ?? this.idName,
        price: price ?? this.price,
        isPin: isPin ?? this.isPin);
  }

  factory ReceiveData.fromJson(Map<String, dynamic> json) {
    return ReceiveData(
      idName: json['id'],
      price: json['price'],
      isPin: false,
    );
  }
}
