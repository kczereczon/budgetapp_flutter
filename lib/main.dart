import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:letbudget/home/home.dart';
import 'package:letbudget/utils/utils.dart';

import 'common/common.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          backgroundColor: Colors.indigo[50],
          primarySwatch: Colors.indigo,
          appBarTheme: const AppBarTheme(
              centerTitle: false,
              color: Colors.white,
              elevation: 0,
              titleTextStyle: TextStyle(color: Colors.black))),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentScreenIndex = 0;
  Converter converter = Converter.pln();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavigationBar(onTap: (index) => setState(() => _currentScreenIndex = index)),
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}





