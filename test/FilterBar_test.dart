import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/FilterBar.dart';

void main() {
  testWidgets('FilterBar test', (WidgetTester tester) async {
    var callbackIndex = 0;
    var filterBar = new FilterBar((index) {
      callbackIndex = index;
    });

    await tester.pumpWidget(
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return new MaterialApp(
            title: 'ToDo list',
            home: new Scaffold(
              bottomNavigationBar: filterBar,
            ),
          );
        },
      ),
    );

    final finder = find.byType(BottomNavigationBar).evaluate().first;
    var navBar;

    navBar = finder.widget as BottomNavigationBar;
    expect(navBar.currentIndex, 0);

    await tester.tap(find.byIcon(Icons.new_releases));
    await tester.pump();
    navBar = finder.widget as BottomNavigationBar;
    expect(navBar.currentIndex, 1);
    expect(callbackIndex, 1);

    await tester.tap(find.byIcon(Icons.done_all));
    await tester.pump();
    navBar = finder.widget as BottomNavigationBar;
    expect(navBar.currentIndex, 2);
    expect(callbackIndex, 2);
  });
}
