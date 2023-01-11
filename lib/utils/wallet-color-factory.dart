import 'package:flutter/material.dart';

class WalletTypeColorBudgetFactory {
  static Color getColor(String type, BuildContext context) {
    switch (type) {
      case 'budget':
        return Theme.of(context).primaryColor;
      case 'savings':
        return Colors.orange;
      default:
        return Colors.yellow;
    }
  }
}