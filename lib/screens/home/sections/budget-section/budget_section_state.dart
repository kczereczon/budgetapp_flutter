part of 'budget_section_bloc.dart';

enum BudgetSectionStatus { initial, success, failure }

@immutable
class BudgetSectionState extends Equatable {
  final int amount;
  final String amountString;
  final BudgetSectionStatus status;

  const BudgetSectionState({required this.amountString, required this.amount, required this.status});

  @override
  // TODO: implement props
  List<Object?> get props => [amount, status];

}

class BudgetSectionInitial extends BudgetSectionState {
  const BudgetSectionInitial(): super(amount: 0, amountString: "", status: BudgetSectionStatus.initial);

}
class BudgetSectionSuccess extends BudgetSectionState {
  const BudgetSectionSuccess({required int amount, required String amountString}) : super(amount: amount, amountString: amountString, status: BudgetSectionStatus.success);
}

class BudgetSectionFailure extends BudgetSectionState {
  const BudgetSectionFailure() : super(amount: 0, amountString: "", status: BudgetSectionStatus.failure);
}