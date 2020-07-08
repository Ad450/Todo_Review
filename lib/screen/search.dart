import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static final searchscreen = '/searchscreen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller = TextEditingController();
  List<String> dummyList = [
    'go to the gym '
        'go to the store'
        'go to the shop'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: TextField(
                autofocus: true,
                controller: _controller,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 35),
                  prefixIcon: Icon(Icons.search,
                      color: Theme.of(context).accentColor, size: 30),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor)),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 21, vertical: 20),
                child: ListView(
                    // show list matching initial list of tasks
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
