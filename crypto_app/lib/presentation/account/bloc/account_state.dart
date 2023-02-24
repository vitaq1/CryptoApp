part of 'account_bloc.dart';

@immutable
abstract class AccountState {}

class AccountInitial extends AccountState {
}

class ShowDataState extends AccountState{
  final List<Currency> holdings;
  ShowDataState(this.holdings);
}



