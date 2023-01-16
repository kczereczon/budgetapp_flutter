import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letbudget/common/common.dart';
import 'package:letbudget/core/transactions/transactions_bloc.dart';
import 'package:letbudget/screens/home/sections/sections.dart';
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
            title: const CustomAppBar(
                user: "Krzysztof Czereczon", notifications: 1)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              BudgetSection(
                converter.formatValue(282133),
              ),
              const SizedBox(
                height: 20,
              ),
              IncomeExpensesSection(converter: converter,),
              const SizedBox(
                height: 20,
              ),
              WalletsSection(
                converter: converter,
              ),
              const SizedBox(
                height: 20,
              ),
              RecentTransactionsSection(converter: converter,)
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
