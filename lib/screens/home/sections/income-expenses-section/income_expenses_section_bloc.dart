import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'income_expenses_section_event.dart';
part 'income_expenses_section_state.dart';

class IncomeExpensesSectionBloc extends Bloc<IncomeExpensesSectionEvent, IncomeExpensesSectionState> {
  IncomeExpensesSectionBloc() : super(IncomeExpensesSectionInitial()) {
    on<IncomeExpensesSectionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
