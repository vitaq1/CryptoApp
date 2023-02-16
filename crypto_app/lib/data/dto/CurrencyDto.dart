import 'package:crypto_app/domain/model/Currency.dart';

class CurrencyDto {
  String code;
  String name;
  String color;
  String assetId;

  CurrencyDto(
      {required this.code,
        required this.name,
        required this.color,
        required this.assetId});

  factory CurrencyDto.fromJson(Map<String, dynamic> json) => CurrencyDto(
    code: json["code"],
    name: json["name"],
    color: json["color"],
    assetId: json["assetId"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "color": color,
    "assetId": assetId,
  };

  Currency toCurrency(){
    return Currency(code: code, name: name, color: color, assetId: assetId);
  }
}
