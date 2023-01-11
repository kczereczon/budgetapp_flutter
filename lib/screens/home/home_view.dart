import 'package:flutter/material.dart';
import 'package:letbudget/common/common.dart';
import 'package:letbudget/home/budget-banner.dart';
import 'package:letbudget/home/home.dart';
import 'package:letbudget/utils/converter.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final Converter converter = Converter.pln();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavigationBar(onTap: (index) => ''),
      appBar: AppBar(
          title: const CustomAppBar(user: "Krzysztof Czereczon", notifications: 1)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            SummaryBanner(
              converter.formatValue(282133),
            ),
            const SizedBox(
              height: 20,
            ),
            IncomeExpensesSection(income: converter.formatValue(46900), expenses: converter.formatValue(10000)),
            const SizedBox(
              height: 20,
            ),
            WalletsSection(
              wallets: [
                Wallet(
                    money: converter.formatValue(4500),
                    image: AssetImage("images/food.jpg"),
                    category: "Food",
                    type: "budget"),
                Wallet(
                    money: converter.formatValue(10000),
                    image: AssetImage("images/clothing.jpg"),
                    category: "Clothing",
                    type: "budget"),
                Wallet(
                    money: converter.formatValue(100000),
                    image: AssetImage("images/home.webp"),
                    category: "Home",
                    type: "savings")
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            RecentTransactionsSection(records: [
              Record(
                icon: Icons.fastfood,
                label: "Food & Beverage",
                date: "Today 23:32",
                isExpense: true,
                value: converter.formatValue(1099),
                color: Colors.orange,
                category: "Food",
              ),
              Record(
                  icon: Icons.attach_money,
                  label: "Pension",
                  date: "Today 10:10",
                  isExpense: false,
                  value: converter.formatValue(830000),
                  color: Colors.blue,
                  category: "Pension")
            ])
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => '',
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
