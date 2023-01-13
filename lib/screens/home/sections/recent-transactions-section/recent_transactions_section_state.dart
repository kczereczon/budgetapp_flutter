part of 'recent_transactions_section_bloc.dart';

@immutable
abstract class RecentTransactionsSectionState {}

class RecentTransactionsSectionInitial extends RecentTransactionsSectionState {}
class RecentTransactionsSectionLoaded extends RecentTransactionsSectionState {
  RecentTransactionsSectionLoaded({required this.transactions});
  final List<Transaction> transactions;
}