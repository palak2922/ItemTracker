import 'package:flutter/material.dart';
import 'package:item_tracker/Model/Task_Data.dart';
import 'package:provider/provider.dart';
import 'UI/HomePage.dart';


void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskData(),
      child: MaterialApp(
        title: 'Item Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: TaskScreen(),
        // home: TaskScreen1(),
      ),
    );
  }
}

