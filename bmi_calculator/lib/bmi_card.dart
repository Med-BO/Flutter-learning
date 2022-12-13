import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {
  final Color? colour;
  final Widget? cardChild;
  final VoidCallback? tapFunction;

  BMICard(this.colour, this.cardChild, this.tapFunction);
  BMICard.named({this.colour, this.cardChild, this.tapFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapFunction,
      child: Expanded(
        child: Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: colour,
          ),
          child: cardChild,
        ),
      ),
    );
  }
}
