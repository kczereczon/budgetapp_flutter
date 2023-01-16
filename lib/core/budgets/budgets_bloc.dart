import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:letbudget/models/models.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'budgets_event.dart';

part 'budgets_state.dart';

class BudgetsBloc extends Bloc<BudgetsEvent, BudgetsState> {

  final _budgets = BehaviorSubject<List<Budget>>();

  Stream<List<Budget>> get transactions => _budgets.stream;

  void fetchBudgets() async {
    // Fetch transactions from API or file
    List<Budget> fetchedBudgets = await _fetchBudgets();
    print(fetchedBudgets);
    _budgets.sink.add(fetchedBudgets);
  }

  BudgetsBloc() : super(BudgetsInitial()) {
    on<FetchBudgets>((event, emit) {
      emit(BudgetsLoading());
      fetchBudgets();
      emit(BudgetsLoaded());
    });

    add(FetchBudgets());
  }

  Future<List<Budget>> _fetchBudgets() async {
    return Future<List<Budget>>.delayed(Duration(seconds: Random.secure().nextInt(3)), () {
      return <Budget>[
        Budget(transactions: [
          Transaction(
              id: 1,
              label: 'Food and good',
              amount: 3000,
              isExpense: true,
              createdAt: DateTime.now(),
              subcategory: const Subcategory(
                  id: 1,
                  name: "Super category",
                  category: Category(id: 1,
                      name: "Super",
                      icon: Icons.fastfood,
                      color: Colors.orange))),
          Transaction(
              id: 1,
              label: 'Food and good',
              amount: 1399,
              isExpense: true,
              createdAt: DateTime.now(),
              subcategory: const Subcategory(
                  id: 1,
                  name: "Super category",
                  category: Category(id: 1,
                      name: "Super",
                      icon: Icons.fastfood,
                      color: Colors.orange))),
          Transaction(
              id: 1,
              label: 'Food and good',
              amount: 1399,
              isExpense: true,
              createdAt: DateTime.now(),
              subcategory: const Subcategory(
                  id: 1,
                  name: "Super category",
                  category: Category(id: 1,
                      name: "Super",
                      icon: Icons.fastfood,
                      color: Colors.orange))),
          Transaction(
              id: 1,
              label: 'Food and good',
              amount: 1399,
              isExpense: true,
              createdAt: DateTime.now(),
              subcategory: const Subcategory(
                  id: 1,
                  name: "Super category",
                  category: Category(id: 1,
                      name: "Super",
                      icon: Icons.fastfood,
                      color: Colors.orange))),
          Transaction(
              id: 1,
              label: 'Food and good',
              amount: 1399,
              isExpense: true,
              createdAt: DateTime.now(),
              subcategory: const Subcategory(
                  id: 1,
                  name: "Super category",
                  category: Category(id: 1,
                      name: "Super",
                      icon: Icons.fastfood,
                      color: Colors.orange))),
        ],
            subcategory: const Subcategory(id: 1,
                category: Category(id: 1,
                    name: "Food",
                    icon: Icons.fastfood,
                    color: Colors.orange),
                name: "Food at work"),
            imageUrl: "https://assets.entrepreneur.com/content/3x2/2000/eating-lunch-at-desk-work.jpg",
            id: 1,
            amount: 10000),
      ];
    });
  }
}
