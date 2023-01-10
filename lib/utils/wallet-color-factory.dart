import 'package:flutter/material.dart';

class WalletTypeColorBudgetFactory {
  static Color getColor(String type) {
    switch (type) {
      case 'budget':
        return Colors.indigo;
      case 'savings':
        return Colors.orange;
      default:
        return Colors.yellow;
    }
  }
}