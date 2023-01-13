import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:letbudget/core/transactions_bloc.dart';
import 'package:letbudget/models/models.dart';
import 'package:meta/meta.dart';

part 'income_expenses_section_event.dart';

part 'income_expenses_section_state.dart';

class IncomeExpensesSectionBloc
    extends Bloc<IncomeExpensesSectionEvent, IncomeExpensesSectionState> {
  final _transactionsBloc = TransactionsBloc();

  IncomeExpensesSectionBloc() : super(IncomeExpensesSectionInitial()) {
    _transactionsBloc.transactions.listen((transactions) {
      add(UpdateIncomeExpensesSection(transactions: transactions));
    });

    on<UpdateIncomeExpensesSection>((event, emit) {
      emit(IncomeExpensesSectionInitial());

      int expenses = 0;
      int income = 0;

      for (Transaction transaction in event.transactions) {
        if(transaction.isExpense) {
          expenses += transaction.amount;
        } else {
          income += transaction.amount;
        }
      }

      emit(IncomeExpensesSectionLoaded(income: income, expenses: expenses));
    });
  }
}
