import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_6/create_task.dart';
import 'package:flutter_application_6/todo_frame.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List toDoList = [
    ["make brekfast", false],
    ["work", false],
  ];
  final _controller = TextEditingController();
  int _currentIndex = 0;

  void onChanged(bool? value, index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
  void onsave(){
    setState(() {
    toDoList.add([_controller.text , false]);
      
    });
    Navigator.of(context).pop();
  }

  void createNewTask(){
    showDialog(context: context,
     builder: (context){
      return MyDialog(controller : _controller,
       onsave: onsave,  
       onCancel: (){Navigator.of(context).pop();},);
     }

    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "T O D O",
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
          itemBuilder: (context, index) {
            return TodoFrame(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (value) => onChanged(value, index));
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {createNewTask();},
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.add,
              color: Colors.black,
            )),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          fixedColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0.9,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.today_rounded),
              label: "Today",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.upcoming_rounded),
              label: "Upcomming",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
