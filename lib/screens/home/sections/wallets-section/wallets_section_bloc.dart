import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wallets_section_event.dart';
part 'wallets_section_state.dart';

class WalletsSectionBloc extends Bloc<WalletsSectionEvent, WalletsSectionState> {
  WalletsSectionBloc() : super(WalletsSectionInitial()) {
    on<WalletsSectionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
