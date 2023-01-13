part of 'income_expenses_section_bloc.dart';

@immutable
abstract class IncomeExpensesSectionEvent {}
class UpdateIncomeExpensesSection extends IncomeExpensesSectionEvent {
  UpdateIncomeExpensesSection({required this.transactions});
  final List<Transaction> transactions;
}