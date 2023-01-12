import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'budget_section_event.dart';
part 'budget_section_state.dart';

class BudgetSectionBloc extends Bloc<BudgetSectionEvent, BudgetSectionState> {
  BudgetSectionBloc() : super(BudgetSectionInitial()) {
    on<BudgetSectionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
