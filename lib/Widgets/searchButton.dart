import 'package:completetodo/screen/search.dart';
import 'package:flutter/material.dart';
import '../constants.dart/constants.dart' as constants;

class SearchButton extends StatefulWidget {
  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: IconButton(
        icon: Icon(Icons.search, size: constants.iconSize),
        onPressed: () {
          // show search page
          Navigator.pushNamed(context, SearchScreen.searchscreen);
        },
      ),
    );
  }
}
