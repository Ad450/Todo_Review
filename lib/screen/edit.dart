import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  static final editScreen = '/editScreen';
  final Function showPicker;
  EditScreen({this.showPicker});
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  DateTime selectedDate;
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
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: TextField(
                  controller: _controller,
                ),
              ),
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
                  Text('please pick a date'),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: InkWell(
                  child: Text(
                    'Add Task',
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).accentColor),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
