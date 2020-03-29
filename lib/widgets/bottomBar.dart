import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      width: 261,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: null,
            child: Image.asset(
              "assets/comment.png",
              height: 23,
              width: 23,
            ),
          ),
          GestureDetector(
            onTap: null,
            child: Image.asset(
              "assets/comment.png",
              height: 23,
              width: 23,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/chat"),
            child: Image.asset(
              "assets/comment.png",
              height: 23,
              width: 23,
            ),
          )
        ],
      ),
    );
  }
}
