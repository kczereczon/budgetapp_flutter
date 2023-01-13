import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letbudget/screens/home/home.dart';
import 'package:letbudget/screens/home/sections/budget-section/budget-section.dart';
import 'package:letbudget/utils/converter.dart';

class HomePage extends StatelessWidget {

  final Converter converter = Converter.pln();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
      BlocProvider<BudgetSectionBloc>(create: (_) => BudgetSectionBloc(converter: converter)..add(BudgetSectionFetched())),
    ], child: HomeView());
  }

  HomePage({Key? key}) : super(key: key);
}
