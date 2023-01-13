part of 'transactions_bloc.dart';

@immutable
abstract class TransactionsState {}

class TransactionsInitial extends TransactionsState {}
class TransactionsLoading extends TransactionsState {}
class TransactionsLoaded extends TransactionsState {}
class TransactionsFailed extends TransactionsState {}
