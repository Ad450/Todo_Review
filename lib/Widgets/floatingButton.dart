import 'package:completetodo/database/database.dart';
import 'package:completetodo/provider/provider.dart';
import 'package:completetodo/utils/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


import '../constants.dart/constants.dart' as constants;

class FloatingButton extends StatefulWidget {
  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  DateTime selectedDate;
  bool hasSelectedDate = false;
  TextEditingController _controller = TextEditingController();

  showPicker() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate != null) {
          setState(() {
            selectedDate = pickedDate;
            hasSelectedDate = true;
          });
        }
      },
    );
  }

  refreshList() {
    setState(() {
      DatabaseClass.instance.fromDb();
    });
  }

  showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      //show date

                      showPicker();
                    },
                    icon: Icon(
                      Icons.calendar_today,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Text(hasSelectedDate
                      ? selectedDate.toString()
                      : 'please pick a date'),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: TextField(
                  controller: _controller,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: InkWell(
                  onTap: () {
                    // add task....
                    Task task = Task(
                      taskMessage: _controller.text,
                      date: DateFormat('yy-MMMM-dd').format(selectedDate) ??
                          DateFormat().format(
                            DateTime.now(),
                          ),
                    );
                    Provider.of<TaskProvider>(context, listen: false)
                        .addTask(task);
                    _controller.clear();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add Task',
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).accentColor),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    refreshList();
    return FloatingActionButton(
      child: Icon(Icons.add, color: Colors.black, size: constants.iconSize),
      onPressed: () {
        // showModalBottomSheet
        showBottomSheet();
      },
    );
  }
}
