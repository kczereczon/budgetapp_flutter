import 'package:flutter/material.dart';
import 'package:letbudget/screens/home/sections/wallets-section/components/components.dart';

class WalletsSection extends StatelessWidget {
  final List<Wallet> wallets;

  const WalletsSection({
    required this.wallets,
    Key? key,
  }) : super(key: key);

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
                  "Your budgets",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "2 Budgets",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
            TextButton(
                onPressed: () => print("add new wallet"),
                child: Row(
                  children: const [
                    Icon(
                      Icons.add,
                      size: 20,
                    ),
                    Text("Add new")
                  ],
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: wallets.length,
                itemBuilder: ((context, index) => wallets[index]))),
      ],
    );
  }
}