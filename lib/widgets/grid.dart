import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  const Grid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 19),
      child: Container(

          // width: MediaQuery.of(context).copyWith().size.width / 5,
          // height: MediaQuery.of(context).copyWith().size.width / 5,
          padding: const EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.center,
            child: const Text(
              'INFORMATION TECHNOLOGY',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(241, 24, 52, 1),
                  fontWeight: FontWeight.bold),
            ),
          ),
          decoration: new BoxDecoration(
            color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
            borderRadius: new BorderRadius.all(Radius.circular(7)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                blurRadius: 6.0, // has the effect of softening the shadow
                spreadRadius: 5.0, // has the effect of extending the shadow
                offset: Offset(
                  0, // horizontal, move right 10
                  8, // vertical, move down 10
                ),
              )
            ],
          )),
    );
  }
}
