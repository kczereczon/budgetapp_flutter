import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'budgets_event.dart';
part 'budgets_state.dart';

class BudgetsBloc extends Bloc<BudgetsEvent, BudgetsState> {
  BudgetsBloc() : super(BudgetsInitial()) {
    on<BudgetsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
