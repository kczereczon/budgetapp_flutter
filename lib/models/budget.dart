import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:letbudget/models/models.dart';

class Budget extends Equatable {
  final int id;
  final String imageUrl;
  final int amount;
  final Subcategory subcategory;
  final List<Transaction> transactions;

  const Budget({required this.transactions, required this.subcategory, required this.imageUrl, required this.id, required this.amount});

  int get moneyLeft {
    int currentAmount = amount;

    for (Transaction transaction in transactions) { currentAmount -= transaction.amount;}
    return currentAmount;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, subcategory];
}