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
        height: 190,
        width: 400,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
              children: [
                Text("C R E A T E   T A S K"),
                Expanded(
                    child:
                        Container()), // Empty space to push the icon to the right
                IconButton(
                  icon: Icon(Icons.close, color: Colors.black),
                  onPressed: onCancel,
                ),
              ],
            ),
            SizedBox(
                height: 10.0), // Space between the close icon and the TextField
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade500, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey
                          .shade500, // Border color when enabled but not focused
                      width: 1.0, // Border width
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade300, // Border color when focused
                      width: 1.0, // Border width
                    ),
                  ),
                  hintText: '${([
                        'Set a Meeting',
                        'Remind me to get keys',
                        'Do some assignments',
                        'Make Coffee',
                        'Do Homework'
                      ]..shuffle()).first} ..',
                  hintStyle: TextStyle(
                    color: Colors.grey, // Change this to your desired color
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonsWidget(
                  buttonName: "S A V E",
                  onPressed: onsave,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
