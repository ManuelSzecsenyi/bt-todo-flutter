import 'package:flutter/material.dart';

class MenuBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 25,
        height: 25,
        child: Column(children: [
          Row(children: [
            Dot(),
            Spacer(),
            Dot()
          ]),
          Spacer(),
          Row(children: [
            Dot(),
            Spacer(),
            Dot()
          ],)
        ],)
    );
  }
}

class Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black
      ),
    );
  }
}