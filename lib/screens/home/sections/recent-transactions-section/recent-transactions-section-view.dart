import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letbudget/screens/home/sections/recent-transactions-section/components/components.dart';
import 'package:letbudget/screens/home/sections/recent-transactions-section/recent_transactions_section_bloc.dart';
import 'package:letbudget/utils/converter.dart';
import 'package:shimmer/shimmer.dart';

class RecentTransactionsSection extends StatelessWidget {
  final Converter converter;

  const RecentTransactionsSection({
    Key? key,
    required this.converter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentTransactionsSectionBloc,
        RecentTransactionsSectionState>(
      builder: (context, state) {
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
                height: 600,
                child: (() {
                  if (state is RecentTransactionsSectionLoaded) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: state.transactions.length < 5 ? state.transactions.length : 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Transaction(
                            icon: state
                                .transactions[index].subcategory.category.icon,
                            label: state.transactions[index].label,
                            date:
                                state.transactions[index].createdAt.toString(),
                            isExpense: state.transactions[index].isExpense,
                            value: converter
                                .formatValue(state.transactions[index].amount),
                            color: state
                                .transactions[index].subcategory.category.color,
                            category:
                                state.transactions[index].subcategory.name);
                      },
                    );
                  } else {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Shimmer.fromColors(
                            baseColor: Theme.of(context).primaryColorDark,
                            highlightColor: Colors.white,
                            enabled: true,
                            child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    color: (<Color>() =>
                                        Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Theme.of(context).primaryColorDark
                                            : Theme.of(context)
                                                .primaryColorLight)()),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(8)),
                                            color: (<Color>() =>
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Theme.of(context)
                                                        .primaryColorLight
                                                    : Theme.of(context)
                                                        .primaryColorDark)()),
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 200,
                                                  height: 18,
                                                ),
                                                Container(
                                                  width: 50,
                                                  height: 16,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  width: 100,
                                                  height: 13,
                                                ),
                                              ]),
                                        ),
                                      ),
                                      Container(
                                        width: 200,
                                        height: 16,
                                      )
                                    ])));
                      },
                    );
                  }
                })())
          ],
        );
      },
    );
  }
}
