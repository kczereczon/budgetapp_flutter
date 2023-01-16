import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letbudget/screens/home/sections/sections.dart';
import 'package:letbudget/screens/home/sections/wallets-section/components/components.dart';
import 'package:letbudget/screens/home/sections/wallets-section/components/wallet/wallet_view_shimmer.dart';
import 'package:letbudget/utils/converter.dart';
import 'package:shimmer/shimmer.dart';

import 'components/wallet/wallet_bloc.dart';

class WalletsSection extends StatelessWidget {
  final Converter converter;

  const WalletsSection({
    required this.converter,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletsSectionBloc, WalletsSectionState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Your budgets",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    state is WalletsSectionLoaded
                        ? Text(
                            "${state.budgets.length} Budgets",
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          )
                        : Shimmer.fromColors(
                            baseColor: Theme.of(context).primaryColorDark,
                            highlightColor: Colors.white,
                            enabled: true,
                            child: Container(
                                width: 100,
                                height: 15,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColorDark,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)))))
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
                    itemCount: state is WalletsSectionLoaded
                        ? state.budgets.length
                        : 5,
                    itemBuilder: ((context, index) => state
                            is WalletsSectionLoaded
                        ? Wallet(
                            money: converter
                                .formatValue(state.budgets[index].amount),
                            image: Image.network(state.budgets[index].imageUrl),
                            subcategory: state.budgets[index].subcategory)
                        : const WalletShimmer()))),
          ],
        );
      },
    );
  }
}
