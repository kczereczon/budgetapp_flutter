import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WalletShimmer extends StatelessWidget {
  const WalletShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Theme.of(context).primaryColorDark,
        highlightColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: EdgeInsets.only(right: 10),
          width: 150,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: Colors.grey),
        ));
  }
}
