

import 'package:completetodo/screen/edit.dart';


import 'package:flutter/material.dart';


class TaskView extends StatefulWidget {
  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    // return a List of task widgets from the DatabaseClass.instance.fromDb(),
    // onLongPress of any of the widgets shows the alert Diaglog below
    // ie. ListTile(
    //        onLongPress: (){
    //            alertUser(context);  
   // }
    //)
    return Container();
    
  }

  alertUser(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Task'),
      content: SingleChildScrollView(child: Text('Do you want to edit Task?')),
      actions: [
        FlatButton(
            color: Colors.red,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel')),
        FlatButton(
            color: Theme.of(context).accentColor,
            onPressed: () {
              Navigator.popAndPushNamed(context, EditScreen.editScreen);
            },
            child: Text('OK')),
      ],
    );
  }
}
