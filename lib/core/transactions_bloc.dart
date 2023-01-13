import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:letbudget/models/models.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {

  final _transactions = BehaviorSubject<List<Transaction>>();
  Stream<List<Transaction>> get transactions => _transactions.stream;

  void fetchTransactions() async {
    // Fetch transactions from API or file
    List<Transaction> fetchedTransactions = await _fetchTransactions();
    _transactions.sink.add(fetchedTransactions);

  }

  TransactionsBloc() : super(TransactionsLoading()) {
    on<FetchTransactions>((event, emit) {
      emit(TransactionsLoading());
      fetchTransactions();
      emit(TransactionsLoaded());
    });

    add(FetchTransactions());
  }

  Future<List<Transaction>> _fetchTransactions() async {
    return Future<List<Transaction>>.delayed(Duration(seconds: 3), () {
      return <Transaction>[
        Transaction(
            id: 1,
            label: 'Pension',
            amount: 830000,
            isExpense: false,
            createdAt: DateTime.now(),
            subcategory: const Subcategory(
                id: 1,
                name: "Super category",
                category: Category(id: 1, name: "Super", icon: Icons.attach_money, color: Colors.blue))),
        Transaction(
            id: 1,
            label: 'Food and good',
            amount: 3000,
            isExpense: true,
            createdAt: DateTime.now(),
            subcategory: const Subcategory(
                id: 1,
                name: "Super category",
                category: Category(id: 1, name: "Super", icon: Icons.fastfood, color: Colors.orange))),
        Transaction(
            id: 1,
            label: 'Food and good',
            amount: 1399,
            isExpense: true,
            createdAt: DateTime.now(),
            subcategory: const Subcategory(
                id: 1,
                name: "Super category",
                category: Category(id: 1, name: "Super", icon: Icons.fastfood, color: Colors.orange))),
        Transaction(
            id: 1,
            label: 'Food and good',
            amount: 1399,
            isExpense: true,
            createdAt: DateTime.now(),
            subcategory: const Subcategory(
                id: 1,
                name: "Super category",
                category: Category(id: 1, name: "Super", icon: Icons.fastfood, color: Colors.orange))),
        Transaction(
            id: 1,
            label: 'Food and good',
            amount: 1399,
            isExpense: true,
            createdAt: DateTime.now(),
            subcategory: const Subcategory(
                id: 1,
                name: "Super category",
                category: Category(id: 1, name: "Super", icon: Icons.fastfood, color: Colors.orange))),
        Transaction(
            id: 1,
            label: 'Food and good',
            amount: 1399,
            isExpense: true,
            createdAt: DateTime.now(),
            subcategory: const Subcategory(
                id: 1,
                name: "Super category",
                category: Category(id: 1, name: "Super", icon: Icons.fastfood, color: Colors.orange))),
      ];
    });
  }
}
