import 'package:flutter/material.dart';
import './mg_home_list.dart';
import './more.dart';

class MgBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarState();
  }
}

class _BottomNavigationBarState extends State<MgBottomNavigationBar> {
  int _currentIndex = 0;
  List<Widget> pages = List<Widget>();

  @override
  void initState() {
    pages
      ..add(MgHomeList())
      ..add(MGMoreListView());
  }

  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTapHandler,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
              ),
              title: Text('列表'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('更多'),
            ),
          ],
        ));
  }
}
