import 'package:crypto_app/domain/model/Currency.dart';

class ActiveHolding {
  Currency currency;
  double count;
  double totalValue;
  String iconPath;

  ActiveHolding(this.currency, this.count, this.totalValue, this.iconPath);
}