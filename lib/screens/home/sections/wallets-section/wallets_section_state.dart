part of 'wallets_section_bloc.dart';

@immutable
abstract class WalletsSectionState {}

class WalletsSectionInitial extends WalletsSectionState {}
class WalletsSectionLoaded extends WalletsSectionState {
  WalletsSectionLoaded({required this.budgets});
  final List<Budget> budgets;
}