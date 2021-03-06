import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardStatus extends StatefulWidget {
  final List<dynamic> tickets;
  final Function(dynamic) chooseTicket;
  CardStatus({Key key, this.tickets, this.chooseTicket}) : super(key: key);

  _CardStatusState createState() => _CardStatusState();
}

class _CardStatusState extends State<CardStatus> {
  _createCard() {
    List<Widget> cards = List();
    widget.tickets.forEach((item) => {
          print(item),
          item['approved'] == 3
              ? cards.add(Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).copyWith().size.width,
                          height: MediaQuery.of(context).copyWith().size.width /
                              12.4138,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              item['date'] != null
                                  ? DateFormat('dd-MM-yyyy')
                                      .format(DateTime.parse(item['date']))
                                  : "-",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          decoration: new BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: new BorderRadius.only(
                                topLeft: Radius.circular(7),
                                topRight: Radius.circular(7)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.16),
                                blurRadius:
                                    6.0, // has the effect of softening the shadow
                                spreadRadius:
                                    5.0, // has the effect of extending the shadow
                                offset: Offset(
                                  0, // horizontal, move right 10
                                  8, // vertical, move down 10
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                          onTap: () => widget.chooseTicket(item),
                          child: Container(

                              // width: MediaQuery.of(context).copyWith().size.width / 5,
                              height:
                                  MediaQuery.of(context).copyWith().size.width /
                                      4.5,
                              padding: const EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  item['subject'] != null
                                      ? item['subject']
                                      : '-',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              decoration: new BoxDecoration(
                                color: Colors.grey[
                                    850], //new Color.fromRGBO(255, 0, 0, 0.0),
                                borderRadius: new BorderRadius.only(
                                    bottomLeft: Radius.circular(7),
                                    bottomRight: Radius.circular(7)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                    blurRadius:
                                        6.0, // has the effect of softening the shadow
                                    spreadRadius:
                                        5.0, // has the effect of extending the shadow
                                    offset: Offset(
                                      0, // horizontal, move right 10
                                      8, // vertical, move down 10
                                    ),
                                  )
                                ],
                              ))),
                    ],
                  ),
                ))
              : item['approved'] == 1
                  ? cards.add(Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Container(
                              width:
                                  MediaQuery.of(context).copyWith().size.width,
                              height:
                                  MediaQuery.of(context).copyWith().size.width /
                                      12.4138,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  item['date'] != null
                                      ? DateFormat('dd-MM-yyyy')
                                          .format(DateTime.parse(item['date']))
                                      : "-",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              decoration: new BoxDecoration(
                                color: Color.fromRGBO(139, 195, 74, 1),
                                borderRadius: new BorderRadius.only(
                                    topLeft: Radius.circular(7),
                                    topRight: Radius.circular(7)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                    blurRadius:
                                        6.0, // has the effect of softening the shadow
                                    spreadRadius:
                                        5.0, // has the effect of extending the shadow
                                    offset: Offset(
                                      0, // horizontal, move right 10
                                      8, // vertical, move down 10
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                              onTap: () => widget.chooseTicket(item),
                              child: Container(

                                  // width: MediaQuery.of(context).copyWith().size.width / 5,
                                  height: MediaQuery.of(context)
                                          .copyWith()
                                          .size
                                          .width /
                                      4.5,
                                  padding: const EdgeInsets.all(10),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      item['subject'] != null
                                          ? item['subject']
                                          : '-',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  decoration: new BoxDecoration(
                                    color: Colors.grey[
                                        850], //new Color.fromRGBO(255, 0, 0, 0.0),
                                    borderRadius: new BorderRadius.only(
                                        bottomLeft: Radius.circular(7),
                                        bottomRight: Radius.circular(7)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.16),
                                        blurRadius:
                                            6.0, // has the effect of softening the shadow
                                        spreadRadius:
                                            5.0, // has the effect of extending the shadow
                                        offset: Offset(
                                          0, // horizontal, move right 10
                                          8, // vertical, move down 10
                                        ),
                                      )
                                    ],
                                  ))),
                        ],
                      ),
                    ))
                  : cards.add(Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Container(
                              width:
                                  MediaQuery.of(context).copyWith().size.width,
                              height:
                                  MediaQuery.of(context).copyWith().size.width /
                                      12.4138,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  item['date'] != null
                                      ? DateFormat('dd-MM-yyyy')
                                          .format(DateTime.parse(item['date']))
                                      : "-",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              decoration: new BoxDecoration(
                                color: Colors.red[400],
                                borderRadius: new BorderRadius.only(
                                    topLeft: Radius.circular(7),
                                    topRight: Radius.circular(7)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                    blurRadius:
                                        6.0, // has the effect of softening the shadow
                                    spreadRadius:
                                        5.0, // has the effect of extending the shadow
                                    offset: Offset(
                                      0, // horizontal, move right 10
                                      8, // vertical, move down 10
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                              onTap: () => widget.chooseTicket(item),
                              child: Container(

                                  // width: MediaQuery.of(context).copyWith().size.width / 5,
                                  height: MediaQuery.of(context)
                                          .copyWith()
                                          .size
                                          .width /
                                      4.5,
                                  padding: const EdgeInsets.all(10),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      item['subject'] != null
                                          ? item['subject']
                                          : '-',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  decoration: new BoxDecoration(
                                    color: Colors.grey[
                                        850], //new Color.fromRGBO(255, 0, 0, 0.0),
                                    borderRadius: new BorderRadius.only(
                                        bottomLeft: Radius.circular(7),
                                        bottomRight: Radius.circular(7)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.16),
                                        blurRadius:
                                            6.0, // has the effect of softening the shadow
                                        spreadRadius:
                                            5.0, // has the effect of extending the shadow
                                        offset: Offset(
                                          0, // horizontal, move right 10
                                          8, // vertical, move down 10
                                        ),
                                      )
                                    ],
                                  ))),
                        ],
                      ),
                    ))
        });
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
              crossAxisSpacing: 35,
              mainAxisSpacing: 19,
              crossAxisCount: 2,
              children: _createCard()),
        ),
      ],
    );
  }
}
