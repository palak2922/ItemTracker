import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/Task_Data.dart';
import 'Task_tile.dart';

class TaskLists extends StatelessWidget {

  final GlobalKey _key = GlobalKey();
  late final snackBar;

  void _getSizeAndPosition() {
    if (_key.currentContext != null) {
      final RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
      final size = renderBox.size;
      final position = renderBox.localToGlobal(Offset.zero);
      print('Size: ${size.toString()}, Position: ${position.toString()}');
      snackBar = SnackBar(content: Text('Size: ${size.toString()}, Position: ${position.toString()}'));
    } else {
      print('RenderBox context is not available yet.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: ElevatedButton(
            onPressed: () {
              _getSizeAndPosition();
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            child: Text('Get Size and Position'),
          ),
        ),

        Expanded(
          child: Consumer<TaskData>(
              builder: (context, data, child) {
                return ListView.builder(
                  key: _key,
                  itemCount: data.taskCount,
                  itemBuilder: (context, index) {
                    print('data.taskCount');
                    print(data.taskCount);
                    return TaskTile(
                      taskTitle: data.tasks[index].title!,
                      taskDescription: data.tasks[index].description!,
                      index: index,
                    );
                  },
                );
              }
          ),
        ),
      ],
    );
  }
}
