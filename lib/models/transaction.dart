import 'package:equatable/equatable.dart';
import 'package:letbudget/models/subcategory.dart';

class Transaction extends Equatable {

  final int id;
  final String label;
  final DateTime createdAt;
  final int amount;
  final bool isExpense;
  final Subcategory subcategory;

  const Transaction.name(this.id, this.label, this.createdAt, this.amount,
      this.isExpense, this.subcategory);

  @override
  // TODO: implement props
  List<Object?> get props => [id, label, createdAt, amount, isExpense, subcategory];
}