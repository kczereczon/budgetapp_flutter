part of 'budget_section_bloc.dart';

@immutable
abstract class BudgetSectionEvent {}

class FetchBudgetSection extends BudgetSectionEvent {
  FetchBudgetSection({required this.transactions});
  final List<Transaction> transactions;
}
