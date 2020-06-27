import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_data.dart';


class AddTaskScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    String text;

    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                onChanged: (value) {
                  text = value;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                color: Colors.lightBlueAccent,
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed:(){
                  if(text != null) {
                    print(text);
                    Provider.of<TaskData>(context, listen: false).addTask(text);
                    Navigator.pop(context);
                  }else if(text == null){
                    Provider.of<TaskData>(context, listen: false).addTask('Not Specified!!!');
                    Navigator.pop(context);
                  }
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
