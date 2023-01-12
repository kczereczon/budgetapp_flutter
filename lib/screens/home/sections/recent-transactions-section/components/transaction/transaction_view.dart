import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String category;
  final String date;
  final bool isExpense;
  final String value;

  const Transaction({
    Key? key,
    required this.icon,
    required this.label,
    required this.date,
    required this.isExpense,
    required this.value,
    required this.color,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: (<Color>() => Theme.of(context).brightness == Brightness.dark ? Theme.of(context).primaryColorDark : Theme.of(context).primaryColorLight)()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: (<Color>() => Theme.of(context).brightness == Brightness.dark ? Theme.of(context).primaryColorLight : Theme.of(context).primaryColorDark)()),
            child: Icon(
              icon,
              color: color,
              size: 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(category,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(date,
                        style: const TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 13))
                  ]),
            ),
          ),
          Text(
            value,
            style: TextStyle(
                color: (() => isExpense ? Colors.red : Colors.green)(),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}