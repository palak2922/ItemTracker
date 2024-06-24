import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:item_tracker/Model/Task_Data.dart';
import 'package:item_tracker/UI/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('ItemListScreen displays a list of items', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => TaskData(),
        child: MaterialApp(
          home: TaskScreen(),
        ),
      ),
    );

    expect(find.byType(ListTile), findsNothing);

    final taskProvider = Provider.of<TaskData>(tester.element(find.byType(TaskScreen)), listen: false);
    taskProvider.addTaskData('Item 1', 'Description 1');
    taskProvider.addTaskData('Item 2', 'Description 2');

    await tester.pump();

    expect(find.byType(ListTile), findsNWidgets(2));
  });
}
