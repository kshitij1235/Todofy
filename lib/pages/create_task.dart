import 'package:flutter/material.dart';
import 'package:todfy/utils/app_button.dart';

class MyDialog extends StatelessWidget {
  final VoidCallback onsave;
  final VoidCallback onCancel;
  final TextEditingController controller;

  MyDialog({
    super.key,
    required this.onsave,
    required this.onCancel,
    required this.controller,
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
            MaterialButton(onPressed: onCancel,
          child: Text("X"),),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black, // Border color when enabled but not focused
                    width: 1.0, // Border width
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black, // Border color when focused
                    width: 1.0, // Border width
                  ),
                ),
                hintText: ([
                  'Set a Meeting..',
                  'Remind me to get keys..',
                  'Do some assignments..'
                ]..shuffle()).first,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [  
                ButtonsWidget(buttonName: "S A V E", 
                
                onPressed: onsave),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
