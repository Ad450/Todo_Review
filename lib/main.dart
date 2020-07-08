import 'package:completetodo/database/database.dart';
import 'package:completetodo/provider/provider.dart';

import 'package:completetodo/screen/edit.dart';
import 'package:completetodo/screen/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Widgets/todoApp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseClass.instance.getDatabase;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => TaskProvider())],
      child: MaterialApp(
        routes: {
          SearchScreen.searchscreen: (context) => SearchScreen(),
          EditScreen.editScreen: (context) => EditScreen()
        },
        debugShowCheckedModeBanner: false,
        title: 'TOdo App',
        home: TodoApp(),
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
      ),
    );
  }
}
