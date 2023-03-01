part of 'trading_bloc.dart';

@immutable
abstract class TradingEvent {}


class BuyCurrencyEvent extends TradingEvent{
  Currency currency;
  double amount;
  BuyCurrencyEvent(this.currency, this.amount);
}
class SellCurrencyEvent extends TradingEvent{
  Currency currency;
  double amount;
  SellCurrencyEvent(this.currency, this.amount);
}

class UpdateCurrencyEvent extends TradingEvent{
  Currency currency;
  UpdateCurrencyEvent(this.currency);
}