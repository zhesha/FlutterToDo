import 'package:flutter/material.dart';

class FilterBar extends StatefulWidget {
  final state;

  FilterBar(Function onChange, {Key key})
      : state = new FilterBarState(onChange),
        super(key: key);

  @override
  State createState() => state;
}

class FilterBarState extends State<FilterBar> {
  var currIndex = 0;
  Function onChange;

  FilterBarState(this.onChange) : super();

  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.list), title: new Text('All')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.new_releases), title: new Text('New')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.done_all), title: new Text('Done')),
        ],
        currentIndex: currIndex,
        onTap: (index) {
          setState(() {
            currIndex = index;
          });
          onChange(index);
        });
  }
}
