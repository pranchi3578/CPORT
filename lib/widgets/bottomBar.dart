import 'package:flutter/material.dart';
import '../screens/chat.dart';
import '../screens/newTicket.dart';
import '../screens/status.dart';

class BottomBar extends StatelessWidget {
  @override
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
            onTap: () =>
                Navigator.of(context).pushNamed(MyChatScreen.routeName),
            child: Image.asset(
              "assets/chat.png",
              height: 23,
              width: 23,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(NewTicket.routeName),
            child: Image.asset(
              "assets/add.png",
              height: 23,
              width: 23,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(Status.routeName),
            child: Image.asset(
              "assets/bell.png",
              height: 23,
              width: 23,
            ),
          )
        ],
      ),
    );
  }
}
