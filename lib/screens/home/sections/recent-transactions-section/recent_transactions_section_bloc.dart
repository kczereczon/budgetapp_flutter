import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:letbudget/core/transactions/transactions_bloc.dart';
import 'package:letbudget/models/models.dart';
import 'package:letbudget/screens/home/sections/recent-transactions-section/recent-transactions-section.dart';
import 'package:meta/meta.dart';

part 'recent_transactions_section_event.dart';
part 'recent_transactions_section_state.dart';

class RecentTransactionsSectionBloc extends Bloc<RecentTransactionsSectionEvent, RecentTransactionsSectionState> {

  final _transactionsBloc = TransactionsBloc();

  RecentTransactionsSectionBloc() : super(RecentTransactionsSectionInitial()) {
    on<UpdateRecentTransactionsSection>((event, emit) {
      emit(RecentTransactionsSectionInitial());
      emit(RecentTransactionsSectionLoaded(transactions: event.transactions));
    });

    _transactionsBloc.transactions.listen((transactions) {
      add(UpdateRecentTransactionsSection(transactions: transactions));
    });
  }
}
