part of 'budget_section_bloc.dart';

enum BudgetSectionStatus { initial, success, failure }

@immutable
class BudgetSectionState extends Equatable {
  final int amount;
  final BudgetSectionStatus status;

  const BudgetSectionState({required this.amount, required this.status});

  @override
  // TODO: implement props
  List<Object?> get props => [amount, status];

}

class BudgetSectionInitial extends BudgetSectionState {
  BudgetSectionInitial(): super(amount: 0, status: BudgetSectionStatus.initial);

}
class BudgetSectionSuccess extends BudgetSectionState {
  const BudgetSectionSuccess({required int amount}) : super(amount: amount, status: BudgetSectionStatus.success);
}

class BudgetSectionFailure extends BudgetSectionState {
  const BudgetSectionFailure() : super(amount: 0, status: BudgetSectionStatus.failure);
}