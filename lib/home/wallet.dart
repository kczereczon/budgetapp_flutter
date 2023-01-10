import 'package:flutter/material.dart';
import 'package:letbudget/utils/utils.dart';

class Wallet extends StatelessWidget {
  final String money;
  final ImageProvider image;
  final String category;
  final String type;

  const Wallet({
    required this.money,
    required this.image,
    required this.category,
    required this.type,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: SizedBox(
        width: 150,
        height: 100,
        child: Container(padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: image,
                alignment: const Alignment(-0.6, 20),
                colorFilter: ColorFilter.mode(
                    WalletTypeColorBudgetFactory.getColor(type),
                    BlendMode.color)),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.indigo),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              money,
              style: const TextStyle(shadows: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 0),
                  blurRadius: 10.0,
                ),
              ], color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              category,
              style: const TextStyle(shadows: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 0),
                  blurRadius: 10.0,
                )
              ], color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
            )
          ],
        ),),
      ),
    );
  }
}