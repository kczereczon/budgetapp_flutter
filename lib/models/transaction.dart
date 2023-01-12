import 'package:equatable/equatable.dart';
import 'package:letbudget/models/subcategory.dart';

class Transaction extends Equatable {

  final int id;
  final String label;
  final DateTime createdAt;
  final int amount;
  final bool isExpense;
  final Subcategory subcategory;

  const Transaction({required this.id, required this.label, required this.createdAt, required this.amount,
      required this.isExpense, required this.subcategory});

  @override
  // TODO: implement props
  List<Object?> get props => [id, label, createdAt, amount, isExpense, subcategory];
}