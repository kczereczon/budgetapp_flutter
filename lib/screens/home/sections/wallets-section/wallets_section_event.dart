part of 'wallets_section_bloc.dart';

@immutable
abstract class WalletsSectionEvent {}
class UpdateWalletsSectionEvent extends WalletsSectionEvent {
  UpdateWalletsSectionEvent({required this.budgets});
  final List<Budget> budgets;
}