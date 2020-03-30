import 'package:flutter/material.dart';
import 'package:oneportal/widgets/bottomBar.dart';
import 'package:photo_view/photo_view.dart';

class ViewTicket extends StatefulWidget {
  @override
  _ViewTicketState createState() => _ViewTicketState();
}

class _ViewTicketState extends State<ViewTicket> {
  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> ticket = {
    "subject": "SSLC Certificate",
    "content":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    "attachments": [
      {"id": "12", "title": "assets/comment.png"},
      {"id": "12", "title": "assets/arrow.png"},
    ]
  };

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 24, 52, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                          child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left:
                                    33.0), //Here cant use mquery  //please use mediaquery for all the metices , so it looks cool on all devices
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Subject",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * .0125, //use mediaquery
                          ),
                          Container(
                            height: height * .06,
                            width: width * .866,
                            padding: EdgeInsets.all(width * .03),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Text(ticket['subject'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: height * .018, //use mediaquery
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 33.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Content :",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * .0125,
                          ),
                          Container(
                            height: height * .339,
                            width: width * .866,
                            padding: EdgeInsets.all(width * .03),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: SingleChildScrollView(
                              child: Text(ticket['content'],
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          SizedBox(height: height * .018),
                          Padding(
                            padding: const EdgeInsets.only(left: 33.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Attachments :",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(height: height * .0125),
                          Column(
                              children: ticket['attachments']
                                  .map<Widget>((item) => Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                height: height * .06,
                                                width: 10,
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(30),
                                                            topLeft:
                                                                Radius.circular(
                                                                    30))),
                                                child: Center(
                                                  child: InkWell(
                                                    child: Text("logo"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: height * .06,
                                                // width: 0,
                                                decoration: BoxDecoration(
                                                    color: Color(0xff607D8B),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight: Radius
                                                                .circular(30),
                                                            topRight:
                                                                Radius.circular(
                                                                    30))),
                                                child: Center(
                                                  child: FlatButton(
                                                      onPressed: () {
                                                        // print(ticket['attachments'][index]['title']);
                                                        showDialog(
                                                            context: context,
                                                            child: AlertDialog(
                                                                content:
                                                                    Image.asset(
                                                              item['title'],
                                                              height:
                                                                  height - 50,
                                                              // width: width - 5,
                                                            )));
                                                      },
                                                      child: Image.asset(
                                                        "assets/arrow.png",
                                                        width: width * .0566,
                                                      )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList())
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: height * .0468,
              left: width * .138,
              child: BottomBar(),
            )
          ],
        ),
      ),
    );
  }
}
