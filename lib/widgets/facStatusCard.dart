import 'package:flutter/material.dart';
import 'package:oneportal/screens/chooseFac.dart';

class FacCardStatus extends StatefulWidget {
  final List<dynamic> tickets;
  final Function(dynamic) chooseTicket;
  FacCardStatus({Key key, this.tickets, this.chooseTicket}) : super(key: key);

  _FacCardStatusState createState() => _FacCardStatusState();
}

class _FacCardStatusState extends State<FacCardStatus> {
  _createCard() {
    List<Widget> cards = List();
    widget.tickets.forEach((item) => {
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
                              item['date'] != null ? item['date'] : "-",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          decoration: new BoxDecoration(
                            color: Color.fromRGBO(74, 201, 89, 1),
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
                                    ? item['subject'].toUpperCase()
                                    : '-',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            decoration: new BoxDecoration(
                              color: Colors
                                  .white, //new Color.fromRGBO(255, 0, 0, 0.0),
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
                            )),
                      ),
                    ],
                  ),
                ))
              : cards.add(Padding(
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
                              item['date'] != null ? item['date'] : "-",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          decoration: new BoxDecoration(
                            color: Colors.black26,
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
                                    ? item['subject'].toUpperCase()
                                    : '-',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            decoration: new BoxDecoration(
                              color: Colors
                                  .white, //new Color.fromRGBO(255, 0, 0, 0.0),
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
                            )),
                      ),
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
              crossAxisCount: 1,
              children: _createCard()),
        ),
      ],
    );
  }
}
