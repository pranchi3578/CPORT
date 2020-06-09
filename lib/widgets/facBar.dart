import 'package:flutter/material.dart';

class FacBar extends StatelessWidget {
  @override
  final Function(int) response;
  const FacBar({Key key, this.response}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      width: 261,
      decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            onTap: () => response(2),
            child: Image.asset(
              "assets/close.png",
              height: 25,
              width: 25,
            ),
          ),
          GestureDetector(
            onTap: () => response(3),
            child: Image.asset(
              "assets/send.png",
              height: 25,
              width: 25,
            ),
          ),
          GestureDetector(
            onTap: () => response(1),
            child: Image.asset(
              "assets/tick.png",
              height: 25,
              width: 25,
            ),
          )
        ],
      ),
    );
  }
}
