part of 'account_bloc.dart';

@immutable
abstract class AccountEvent {}


class LoadDataEvent extends AccountEvent{}

class UpdateDataEvent extends AccountEvent{}

class UpdateCurrencyEvent extends AccountEvent{
  Currency currency;
  UpdateCurrencyEvent(this.currency);
}