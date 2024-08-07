import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_6/TodoFrame.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List toDoList = [
    ["make brekfast" , false],
    ["work" , false],

  ];

  void onChanged(bool? value , index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
    
      home: Scaffold(
    
        backgroundColor: Colors.white,
    
        appBar: AppBar(
    
          title: const Text("T O D O",
          style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
          toolbarHeight: 80,
          titleSpacing: 20,
          
          
        ),
    
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder:(context, index) {
            return TodoFrame(taskName: toDoList[index][0], 
            taskCompleted: toDoList[index][1], 
            onChanged: (value)=> onChanged(value,index) );
          },

        )

      ),
      
    );

  }

}
