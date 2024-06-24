import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:item_tracker/Model/Task_Data.dart';
import 'package:provider/provider.dart';

import '../Model/task.dart';
import '../UI/AddTaskScreen.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;
  final index;

  TaskTile(
      {
        required this.taskTitle,
        required this.taskDescription,
        this.index,
      });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
      ),
      subtitle: Text(
        taskDescription,
      ),
      trailing: Container(
        height: 50,
        width: 70,
        child: Row(
          children: [
            GestureDetector(
              onTap: (){
                showModalBottomSheet(context: context, isScrollControlled: true, builder: (context) => SingleChildScrollView(
                    child:Container(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: addTaskScreen(index),
                    )
                ));
              },
              child: Icon(Icons.edit),
            ),
            SizedBox(width: 15,),
            GestureDetector(
              onTap: (){
                Provider.of<TaskData>(context, listen: false).removeTask(index);
              },
              child: Icon(Icons.delete_forever),
            ),
          ],
        ),
      ),
    );
  }
}