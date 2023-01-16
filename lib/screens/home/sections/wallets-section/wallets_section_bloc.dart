import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:letbudget/core/budgets/budgets_bloc.dart';
import 'package:letbudget/models/budget.dart';
import 'package:meta/meta.dart';

part 'wallets_section_event.dart';
part 'wallets_section_state.dart';

class WalletsSectionBloc extends Bloc<WalletsSectionEvent, WalletsSectionState> {
  final _budgetsBloc = BudgetsBloc();

  WalletsSectionBloc() : super(WalletsSectionInitial()) {
    on<UpdateWalletsSectionEvent>((event, emit) {
      emit(WalletsSectionInitial());
      emit(WalletsSectionLoaded(budgets: event.budgets));
    });

    _budgetsBloc.transactions.listen((budgets) {
      add(UpdateWalletsSectionEvent(budgets: budgets));
    });
  }
}
