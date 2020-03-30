import 'package:flutter/material.dart';
import '../widgets/bottomBar.dart';
import '../widgets/grid.dart';

class Department extends StatefulWidget {
  Department({Key key}) : super(key: key);

  _DepartmentState createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 24, 52, 1),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).copyWith().size.width / 5.8065, 0, 0),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).copyWith().size.height / 1.3,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Choose Department",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                      CustomScrollView(
                        primary: false,
                        shrinkWrap: true,
                        slivers: <Widget>[
                          SliverPadding(
                            padding: const EdgeInsets.all(20),
                            sliver: SliverGrid.count(
                              crossAxisSpacing: 35,
                              mainAxisSpacing: 19,
                              crossAxisCount: 2,
                              children: <Widget>[
                                Grid(),
                                Grid(),
                                Grid(),
                                Grid(),
                                Grid(),
                                Grid(),
                                Grid(),
                                Grid()
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 51, 0, 0),
                child: BottomBar(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
