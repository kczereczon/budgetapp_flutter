import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:letbudget/models/models.dart';
import 'package:letbudget/screens/home/sections/budget-section/budget-section.dart';
import 'package:letbudget/utils/converter.dart';
import 'package:meta/meta.dart';

part 'budget_section_event.dart';

part 'budget_section_state.dart';

class BudgetSectionBloc extends Bloc<BudgetSectionEvent, BudgetSectionState> {
  final Converter converter;

  BudgetSectionBloc({required this.converter}) : super(BudgetSectionInitial()) {
    on<BudgetSectionFetched>(_onBudgetSectionFetched);
  }

  Future<void> _onBudgetSectionFetched(
    BudgetSectionFetched event,
    Emitter<BudgetSectionState> emit,
  ) async {
    try {
      List<Transaction> transactions = await _fetchTransactions();

      int amount = 0;

      for (var element in transactions) {
        amount += element.amount * (element.isExpense ? -1 : 1);
      }

      emit(BudgetSectionSuccess(amount: amount, amountString: converter.formatValue(amount)));

    } catch (_) {
      emit(BudgetSectionFailure());
    }
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
                category: Category(id: 1, name: "Super"))),
        Transaction(
            id: 1,
            label: 'Food and good',
            amount: 3000,
            isExpense: true,
            createdAt: DateTime.now(),
            subcategory: const Subcategory(
                id: 1,
                name: "Super category",
                category: Category(id: 1, name: "Super"))),
        Transaction(
            id: 1,
            label: 'Food and good',
            amount: 1399,
            isExpense: true,
            createdAt: DateTime.now(),
            subcategory: const Subcategory(
                id: 1,
                name: "Super category",
                category: Category(id: 1, name: "Super"))),
      ];
    });
  }
}
