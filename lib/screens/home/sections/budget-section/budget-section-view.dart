import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letbudget/screens/home/sections/budget-section/budget-section.dart';
import 'package:shimmer/shimmer.dart';

class BudgetSection extends StatelessWidget {
  final String money;

  const BudgetSection(this.money, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BudgetSectionBloc()..add(BudgetSectionFetched()),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.indigo,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/1.png'),
                colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor, BlendMode.color)),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Shimmer.fromColors(

                  baseColor: Theme.of(context).primaryColorDark,
                  highlightColor: Colors.white,
            enabled: true,
                  child:
                      Container(width: 200,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorDark,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8))))),
                SizedBox(height: 5,),
                const Text(
                  "Your balance",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w200),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
