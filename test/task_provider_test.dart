import 'package:flutter_test/flutter_test.dart';
import 'package:item_tracker/Model/Task_Data.dart';
import 'package:item_tracker/Model/task.dart';

void main() {
  test('Add item', () {
    TaskData taskProvider = TaskData();
    final item = Task(title: 'Item 1', description: 'Description 1');

    taskProvider.addTaskData(item.title!, item.description!);

    expect(taskProvider.taskCount, 1);
    expect(taskProvider.tasks[0].title, 'Item 1');
    expect(taskProvider.tasks[0].description, 'Description 1');
  });

  test('Edit item', () {
    final taskProvider = TaskData();
    final item = Task(title: 'Item 1', description: 'Description 1');
    taskProvider.addTaskData(item.title!, item.description!);

    final newItem = Task(title: 'Updated Item', description: 'Updated Description');
    taskProvider.EditTask(0, newItem);

    expect(taskProvider.tasks.length, 1);
    expect(taskProvider.tasks[0].title, 'Updated Item');
    expect(taskProvider.tasks[0].description, 'Updated Description');
  });

  test('Remove item', () {
    final taskProvider = TaskData();
    final item = Task(title: 'Item 1', description: 'Description 1');
    taskProvider.addTaskData(item.title!, item.description!);

    taskProvider.removeTask(0);

    expect(taskProvider.taskCount, 0);

  });
}
