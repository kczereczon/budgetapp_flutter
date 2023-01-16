part of 'budgets_bloc.dart';

@immutable
abstract class BudgetsEvent {}
class FetchBudgets extends BudgetsEvent {}