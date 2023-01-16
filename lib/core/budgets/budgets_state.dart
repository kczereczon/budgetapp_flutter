part of 'budgets_bloc.dart';

@immutable
abstract class BudgetsState {}

class BudgetsInitial extends BudgetsState {}
class BudgetsLoading extends BudgetsState {}
class BudgetsLoaded extends BudgetsState {}
class BudgetsFailed extends BudgetsState {}