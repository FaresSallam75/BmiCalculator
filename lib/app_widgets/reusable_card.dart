import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReusableCard extends StatelessWidget {
  var culor;
  var cardChild;
  void Function()? onTab;
  ReusableCard({super.key, this.culor, this.cardChild, this.onTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          // color: Color(0xff1D1E55),
          // color: Color(0xff1D1E70),
          color: culor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
