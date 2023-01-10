import 'package:flutter/material.dart';
import 'home.dart';

class RecentTransactionsSection extends StatelessWidget {
  const RecentTransactionsSection({
    Key? key,
    required this.records,
  }) : super(key: key);

  final List<Record> records;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Recent transactions",
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            TextButton(
                onPressed: () => print("see all"),
                child: Row(
                  children: const [Text("See all")],
                ))
          ],
        ),
        SizedBox(
            height: 400,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: records.length,
              itemBuilder: (BuildContext context, int index) {
                return records[index];
              },
            )),
      ],
    );
  }
}