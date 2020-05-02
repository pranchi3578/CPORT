import 'package:flutter/material.dart';
import 'package:oneportal/screens/chooseFac.dart';
import '../widgets/bottomBar.dart';
import '../widgets/grid.dart';

class Department extends StatefulWidget {
  final Map<dynamic, dynamic> content;

  static const routeName = "/choose-dept";

  Department({Key key, this.content}) : super(key: key);

  _DepartmentState createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  var argument = Map();
  static String _department = null;
  final items = {
    'IT': 'INFORMATION TECHNOLOGY',
    'CS': 'COMPUTER SCIENCE',
    'CE': 'CIVIL ENGINEERING',
    'FS': 'FIRE AND SAFETY',
    'ME': 'MECHANICAL',
    'EE': 'ELECTRICAL',
    'EC': 'ELECTRONICS'
  };
  List<Widget> dept = List();

  @override
  void initState() {
    // TODO: implement initState
    print(widget.content);

    for (String key in items.keys) {
      dept.add(Grid(
          label: key,
          value: items[key],
          chooseDept: (String) => selectedDept(String)));
    }

    super.initState();
  }

  selectedDept(dept) {
    setState(() {
      _department = dept;
    });
    if (_department != null) print(_department);
    Navigator.pushNamed(context, ChooseFaculty.routeName,
        arguments: ChooseFaculty(
            contentPassed: argument, departmentSelected: _department));
  }

  @override
  Widget build(BuildContext context) {
    final Department args = ModalRoute.of(context).settings.arguments;
    argument = args.content;
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 24, 52, 1),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).copyWith().size.width / 5.8065, 0, 0),
        child: Center(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).copyWith().size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                        args.content['subject'],
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
                                children: dept),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 50,
                child: BottomBar(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
