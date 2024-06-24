import 'package:flutter/cupertino.dart';
import 'task.dart';



class TaskData extends ChangeNotifier{

  List<Task> _task = [];

  int get taskCount{
    return _task.length;
  }

  List<Task> get tasks{
    return _task;
  }

  void addTaskData(String title, String desctiption){
    _task.add(Task(title: title, description: desctiption));
    notifyListeners();
  }

  // void doneTask(Task task){
  //   task.toggleDone();
  //   notifyListeners();
  // }

  void removeTask(int index){
    // if (index >= 0 && index < _task.length) {
      _task.removeAt(index);
      notifyListeners();
    // }
  }

  void EditTask(int index, Task task){
    if (index >= 0 && index < _task.length) {
      _task[index] = task;
      notifyListeners();
    }
  }

}

