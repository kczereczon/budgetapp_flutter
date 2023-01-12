import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'recent_transactions_section_event.dart';
part 'recent_transactions_section_state.dart';

class RecentTransactionsSectionBloc extends Bloc<RecentTransactionsSectionEvent, RecentTransactionsSectionState> {
  RecentTransactionsSectionBloc() : super(RecentTransactionsSectionInitial()) {
    on<RecentTransactionsSectionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
