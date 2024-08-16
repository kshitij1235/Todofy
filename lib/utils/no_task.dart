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
            color: Color.fromARGB(255, 228, 124, 124),
            size: 48.0, // Larger size for emphasis
          ),
          SizedBox(height: 16.0), 
          Text(
            "N O   T A S K   H E R E",
            style: TextStyle(
              color: Color.fromARGB(255, 158, 158, 158),
              fontSize: 20.0, 
            ),
          ),
        ],
      ),
    );
  }
}
