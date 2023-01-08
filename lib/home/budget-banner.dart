import 'package:flutter/material.dart';

class SummaryBanner extends StatelessWidget {
  final String money;

  const SummaryBanner(this.money, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.indigo,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/1.png'),
              colorFilter: ColorFilter.mode(Colors.indigo, BlendMode.color)),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    money,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const Text(
                    "Your balance",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w200),
                  )
                ])
          ],
        ),
      ),
    );
  }
}