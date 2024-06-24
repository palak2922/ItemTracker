import 'package:flutter/material.dart';
import 'package:item_tracker/Model/Task_Data.dart';
import 'package:provider/provider.dart';

import '../Model/task.dart';


class addTaskScreen extends StatelessWidget {

  final int index;
  addTaskScreen(this.index);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? newTitle;
    String? newTitledescription;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            )),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                index == -1 ? 'Add Task' : 'Edit Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 30
              ),),

              SizedBox(height: 10,),
              TextFormField(
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: index == -1 ? 'Add Title' : Provider.of<TaskData>(context, listen: false).tasks[index].title,
                ),
                onChanged: (value){
                  newTitle = value;
                },
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Required Field';
                  }else {
                    return null;
                  }
                },
              ),

              SizedBox(height: 10,),
              TextFormField(
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: index == -1 ? 'Add Description' : Provider.of<TaskData>(context, listen: false).tasks[index].description,
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Required Field';
                  }else {
                    return null;
                  }
                },
                onChanged: (value){
                  newTitledescription = value;
                },
              ),

              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  if(!_formKey.currentState!.validate()){
                    return;
                  }

                  index == -1 ?
                  Provider.of<TaskData>(context, listen: false).addTaskData(newTitle!, newTitledescription!):
                  Provider.of<TaskData>(context, listen: false).EditTask(index, Task(title: newTitle, description: newTitledescription));
                  Navigator.pop(context);

                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  color: Colors.deepPurple,
                child: Text(
                  index == -1 ? 'Add' : 'Edit',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
