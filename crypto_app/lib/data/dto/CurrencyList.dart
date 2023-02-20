import 'package:crypto_app/data/dto/CurrencyDto.dart';

class CurrencyList {

  List<CurrencyDto> data;

	CurrencyList.fromJsonMap(Map<String, dynamic> map):
		data = List<CurrencyDto>.from(map["data"].map((it) => CurrencyDto.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['data'] = data != null ? 
			this.data.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
