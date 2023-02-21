
class CurrencyDto {

  late String code;
  late String name;
  late String color;


  CurrencyDto({
      required this.code,
      required this.name,
      required this.color,
     });

  CurrencyDto.fromJson(dynamic json) {
    code = json['code'];
    name = json['name'];
    color = json['color'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['name'] = name;
    map['color'] = color;

    return map;
  }



}