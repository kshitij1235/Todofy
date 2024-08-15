import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class todfyFrame extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  todfyFrame({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
    
        padding: const EdgeInsets.only(left: 20 , right: 20 , top: 20),

      child: Slidable(
        

        endActionPane: ActionPane(
          
          motion: StretchMotion(),
          
          children: [

            SlidableAction(
              
              borderRadius: BorderRadius.circular(10),
              icon: Icons.delete,
              onPressed: deleteFunction,
              backgroundColor: Colors.red,
              
              )
          ],
          ),

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
     ) 
    );
  
  }
}

