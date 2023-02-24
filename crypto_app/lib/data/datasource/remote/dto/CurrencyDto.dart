
class CurrencyDto {

  late String code;
  late String name;
  late String color;
  late int sortIndex;


  CurrencyDto({
      required this.code,
      required this.name,
      required this.color,
      required this.sortIndex,
     });

  CurrencyDto.fromJson(dynamic json) {
    code = json['code'];
    name = json['name'];
    color = json['color'];
    sortIndex = json['sort_index'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['name'] = name;
    map['color'] = color;
    map['sort_index'] = sortIndex;

    return map;
  }



}