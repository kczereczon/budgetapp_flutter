import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:letbudget/core/transactions/transactions_bloc.dart';
import 'package:letbudget/models/models.dart';
import 'package:letbudget/screens/home/sections/budget-section/budget-section.dart';
import 'package:letbudget/utils/converter.dart';
import 'package:meta/meta.dart';

part 'budget_section_event.dart';

part 'budget_section_state.dart';

class BudgetSectionBloc extends Bloc<BudgetSectionEvent, BudgetSectionState> {
  final Converter converter;
  final _transactionsBloc = TransactionsBloc();

  BudgetSectionBloc({required this.converter}) : super(BudgetSectionInitial()) {

    on<FetchBudgetSection>(_onBudgetSectionFetched);

    _transactionsBloc.transactions.listen((transactions) {
      add(FetchBudgetSection(transactions: transactions));
    });
  }

  Future<void> _onBudgetSectionFetched(
    FetchBudgetSection event,
    Emitter<BudgetSectionState> emit,
  ) async {
    try {
      List<Transaction> transactions = event.transactions;

      int amount = 0;

      for (var element in transactions) {
        amount += element.amount * (element.isExpense ? -1 : 1);
      }

      emit(BudgetSectionSuccess(amount: amount, amountString: converter.formatValue(amount)));

    } catch (_) {
      emit(BudgetSectionFailure());
    }
  }
}
