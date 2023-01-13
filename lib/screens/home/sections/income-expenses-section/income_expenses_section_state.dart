part of 'income_expenses_section_bloc.dart';

@immutable
abstract class IncomeExpensesSectionState {}

class IncomeExpensesSectionInitial extends IncomeExpensesSectionState {}
class IncomeExpensesSectionLoaded extends IncomeExpensesSectionState {
  IncomeExpensesSectionLoaded({required this.income, required this.expenses});
  final int income;
  final int expenses;
}
