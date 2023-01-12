import 'package:flutter/material.dart';

class IncomeExpensesSection extends StatelessWidget {
  final String income;
  final String expenses;

  const IncomeExpensesSection({
    required this.income,
    required this.expenses,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                color: (<Color>() => Theme.of(context).brightness == Brightness.dark ? Theme.of(context).primaryColorLight : Theme.of(context).primaryColorDark)(),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.indigo,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Income", style: TextStyle(color: Colors.grey)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    income,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            )
          ],
        ),
        Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                color: (<Color>() => Theme.of(context).brightness == Brightness.dark ? Theme.of(context).primaryColorLight : Theme.of(context).primaryColorDark)(),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  Icons.arrow_upward,
                  color: Colors.orange,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Expenses", style: TextStyle(color: Colors.grey)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    expenses,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}