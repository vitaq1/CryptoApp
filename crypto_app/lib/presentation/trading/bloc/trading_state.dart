part of 'trading_bloc.dart';

@immutable
abstract class TradingState {}

class TradingInitial extends TradingState {
}

class CurrencyUpdatedState extends TradingState{
  Currency currency;
  CurrencyUpdatedState(this.currency);
}



