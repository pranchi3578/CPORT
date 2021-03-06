import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  final String value;
  final String label;
  final Function(String) chooseDept;
  const Grid({Key key, this.label, this.value, this.chooseDept})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 19),
      child: GestureDetector(
        onTap: () => chooseDept(label),
        child: Container(

            // width: MediaQuery.of(context).copyWith().size.width / 5,
            // height: MediaQuery.of(context).copyWith().size.width / 5,
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white60,
                    fontWeight: FontWeight.bold),
              ),
            ),
            decoration: new BoxDecoration(
              color: Colors.grey[850], //new Color.fromRGBO(255, 0, 0, 0.0),
              borderRadius: new BorderRadius.all(Radius.circular(7)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  blurRadius: 1.0, // has the effect of softening the shadow
                  spreadRadius: 1, // has the effect of extending the shadow
                  offset: Offset(
                    0, // horizontal, move right 10
                    2, // vertical, move down 10
                  ),
                )
              ],
            )),
      ),
    );
  }
}
