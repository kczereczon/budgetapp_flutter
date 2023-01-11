import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key, required this.onTap}) : super(key: key);

  final Function onTap;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: const [
        Icons.home_filled,
        Icons.insert_chart_outlined_sharp,
        Icons.credit_card,
        Icons.person
      ],
      backgroundColor: Theme.of(context).navigationBarTheme.backgroundColor,
      activeIndex: _bottomNavIndex,
      gapLocation: GapLocation.center,
      activeColor: Theme.of(context).primaryColor,
      inactiveColor: Colors.grey,
      elevation: 20,
      onTap: (index) => setState(() { widget.onTap(index); _bottomNavIndex = index; }),
    );
  }
}
