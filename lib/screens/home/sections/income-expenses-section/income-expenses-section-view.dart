import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letbudget/screens/home/sections/income-expenses-section/income-expenses-section.dart';
import 'package:letbudget/utils/converter.dart';
import 'package:shimmer/shimmer.dart';

class IncomeExpensesSection extends StatelessWidget {
  final Converter converter;

  const IncomeExpensesSection({
    Key? key, required this.converter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeExpensesSectionBloc, IncomeExpensesSectionState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: (<Color>() =>
                        Theme.of(context).brightness == Brightness.dark
                            ? Theme.of(context).primaryColorLight
                            : Theme.of(context).primaryColorDark)(),
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
                      const Text("Income",
                          style: TextStyle(color: Colors.grey)),
                      const SizedBox(
                        height: 10,
                      ),
                      (<Widget>() {
                        if(state is IncomeExpensesSectionLoaded) {
                          return Text(converter.formatValue(state.income),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20));
                        } else {
                          return Shimmer.fromColors(baseColor: Theme
                              .of(context)
                              .primaryColorDark,
                              highlightColor: Colors.white,
                              enabled: true,
                              child: Container(width: 100, height: 30,
                                  decoration: BoxDecoration(
                                      color: Theme
                                          .of(context)
                                          .primaryColorDark,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8)))));
                        }
                      })()
                    ],
                  ),
                )
              ],
            ),
            Wrap(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: (<Color>() =>
                        Theme.of(context).brightness == Brightness.dark
                            ? Theme.of(context).primaryColorLight
                            : Theme.of(context).primaryColorDark)(),
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
                      const Text("Expenses",
                          style: TextStyle(color: Colors.grey)),
                      const SizedBox(
                        height: 10,
                      ),
                      (<Widget>() {
                        if(state is IncomeExpensesSectionLoaded) {
                          return Text(converter.formatValue(state.expenses),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20));
                        } else {
                          return Shimmer.fromColors(baseColor: Theme
                              .of(context)
                              .primaryColorDark,
                              highlightColor: Colors.white,
                              enabled: true,
                              child: Container(width: 100, height: 30,
                                  decoration: BoxDecoration(
                                      color: Theme
                                          .of(context)
                                          .primaryColorDark,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8)))));
                        }
                      })()
                    ],
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
