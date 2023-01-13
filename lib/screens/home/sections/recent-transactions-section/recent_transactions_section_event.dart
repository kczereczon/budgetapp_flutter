part of 'recent_transactions_section_bloc.dart';

@immutable
abstract class RecentTransactionsSectionEvent {}
class UpdateRecentTransactionsSection extends RecentTransactionsSectionEvent {
  UpdateRecentTransactionsSection({required this.transactions});
  final List<Transaction> transactions;
}
