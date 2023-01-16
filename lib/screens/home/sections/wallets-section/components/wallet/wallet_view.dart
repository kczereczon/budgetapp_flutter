import 'package:flutter/material.dart';
import 'package:letbudget/models/models.dart';
import 'package:letbudget/utils/utils.dart';

class Wallet extends StatelessWidget {
  final String money;
  final String moneyLeft;
  final Image image;
  final Subcategory subcategory;

  const Wallet({
    required this.money,
    required this.moneyLeft,
    required this.image,
    required this.subcategory,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(padding: const EdgeInsets.all(15),
        margin: EdgeInsets.only(right: 10),
        width: 150,
        height: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: image.image,
                alignment: const Alignment(-0.6, 20),
                colorFilter: ColorFilter.mode(
                    subcategory.category.color,
                    BlendMode.color)),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: Colors.indigo),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${moneyLeft} (${money})",
              style: const TextStyle(shadows: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 0),
                  blurRadius: 10.0,
                ),
              ], color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              subcategory.name,
              style: const TextStyle(shadows: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 0),
                  blurRadius: 10.0,
                )
              ], color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),
            )
          ],
        ),),
      );
  }
}