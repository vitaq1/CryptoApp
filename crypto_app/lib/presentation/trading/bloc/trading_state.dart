part of 'trading_bloc.dart';

@immutable
abstract class TradingState {}

class TradingInitial extends TradingState {
}

class ShowDataState extends TradingState{
  final List<Currency> holdings;
  ShowDataState(this.holdings);
}



