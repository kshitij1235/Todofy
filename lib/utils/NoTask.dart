import 'package:flutter/material.dart';

class NoTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.numbers_sharp,
            color: Colors.red,
            size: 48.0, // Larger size for emphasis
          ),
          SizedBox(height: 16.0), // Spacing between icon and text
          Text(
            "No task here",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0, // Larger font size for emphasis
            ),
          ),
        ],
      ),
    );
  }
}
