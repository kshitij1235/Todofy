import 'package:flutter/material.dart';
import 'package:flutter_application_6/buttos.dart';

class MyDialog extends StatelessWidget {

  VoidCallback onsave;
  VoidCallback onCancel;
  final controller ;

  MyDialog({super.key,
  required this.onsave,
  required this.onCancel,
  required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container( 
        height: 200,
        width: 400,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Set a Meeting..."

            ),
            
          ),

        Row(

          mainAxisAlignment:MainAxisAlignment.end,
          children: [

          ButtonsWidget(buttonName: "Save", onPressed:onsave),
          SizedBox(width: 10),
          ButtonsWidget(buttonName: "Cancel", onPressed: onCancel)

        ],)

        ],)

        ),


    );
  }
}