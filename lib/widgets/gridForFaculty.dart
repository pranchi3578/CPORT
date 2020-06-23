import 'package:flutter/material.dart';

class GridFaculty extends StatelessWidget {
  final dynamic content;
  final Function(int) chooseFac;
  const GridFaculty({Key key, this.content, this.chooseFac}) : super(key: key);

  _createGrid() {
    List<Widget> grids = List();
    content.forEach((item) => {
          grids.add(Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 19),
            child: GestureDetector(
              onTap: () => chooseFac(item['pfId']),
              child: Container(

                  // width: MediaQuery.of(context).copyWith().size.width / 5,
                  // height: MediaQuery.of(context).copyWith().size.width / 5,
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      item['name'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white60,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: new BoxDecoration(
                    color:
                        Colors.grey[850], //new Color.fromRGBO(255, 0, 0, 0.0),
                    borderRadius: new BorderRadius.all(Radius.circular(7)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.16),
                        blurRadius:
                            1.0, // has the effect of softening the shadow
                        spreadRadius:
                            1.0, // has the effect of extending the shadow
                        offset: Offset(
                          0, // horizontal, move right 10
                          2, // vertical, move down 10
                        ),
                      )
                    ],
                  )),
            ),
          ))
        });
    return grids;
  }

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
              children: _createGrid()),
        ),
      ],
    );
  }
}
