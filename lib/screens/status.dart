import 'dart:collection';

import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  List<Widget> _messages = <Widget>[
    new Text('hello'),
    new Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.album),
            title: Text('The Enchanted Nightingale'),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('BUY TICKETS'),
                onPressed: () {/* ... */},
              ),
              FlatButton(
                child: const Text('LISTEN'),
                onPressed: () {/* ... */},
              ),
            ],
          ),
        ],
      ),
    )
  ];
  ScrollController _scrollController = new ScrollController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Card(
                  color: Colors.blueGrey,
                ),
                width: MediaQuery.of(context).copyWith().size.width / 1.05,
                height: MediaQuery.of(context).copyWith().size.width / 2,
              ),
            ],
          ),
          Flexible(
            child: new ListView(
              controller: _scrollController,
              reverse: true,
              shrinkWrap: true,
              children: UnmodifiableListView(_messages),
            ),
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: () {
            setState(() {
              _messages.insert(
                  0,
                  new Card(
                    child: Column(
                      //     mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.album),
                          title: Text('The Enchanted Nightingale'),
                          subtitle: Text(
                              'Music by Julie Gable. Lyrics by Sidney Stein.'),
                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('BUY TICKETS'),
                              onPressed: () {/* ... */},
                            ),
                            FlatButton(
                              child: const Text('LISTEN'),
                              onPressed: () {/* ... */},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ));
            });
            _scrollController.animateTo(
              0.0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }),
    );
  }
}
