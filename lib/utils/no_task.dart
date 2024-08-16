import 'package:flutter/material.dart';

class NoTask extends StatelessWidget {

  NoTask(){
    super.key;
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
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
            "N O   T A S K   H E R E",
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
