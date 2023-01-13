import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letbudget/screens/home/home.dart';
import 'package:letbudget/screens/home/sections/budget-section/budget-section.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
      BlocProvider<BudgetSectionBloc>(create: (_) => BudgetSectionBloc()..add(BudgetSectionFetched())),
    ], child: HomeView());
  }

  const HomePage({Key? key}) : super(key: key);
}
