import 'package:flutter/material.dart';

class TodoFrame extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  const TodoFrame({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
    
        padding: const EdgeInsets.only(left: 20 , right: 20 , top: 20),

      child: Container(
    
        padding: const EdgeInsets.all(20),
    
        decoration: BoxDecoration(
    
          color: Colors.white,

          border: Border.all(),
    
          borderRadius: BorderRadius.circular(10),
    
        ),
    
        child: Row(
    
          children: [
    
            Checkbox(
              value: taskCompleted, 
              onChanged: onChanged,
              activeColor: Colors.black,
            
            ),
            
            Text(

              taskName,
              style: TextStyle(
                
                decoration: taskCompleted? TextDecoration.lineThrough : TextDecoration.none,

              ),

              ),
          ],
        
        ),
      
      ),
    
    );
  
  }
}

