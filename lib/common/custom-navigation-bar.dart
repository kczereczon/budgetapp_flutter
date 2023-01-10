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
      activeIndex: _bottomNavIndex,
      gapLocation: GapLocation.center,
      activeColor: Colors.indigo,
      inactiveColor: Colors.grey,
      elevation: 20,
      notchSmoothness: NotchSmoothness.sharpEdge,
      onTap: (index) => setState(() { widget.onTap(index); _bottomNavIndex = index; }),
    );
  }
}
