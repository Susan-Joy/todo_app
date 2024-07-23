// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
Function(BuildContext)?deleteFunction;

   TodoTile({super.key,
  required this.taskName,
  required this.taskCompleted,
  required this.onChanged,
  required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(),
         children: [SlidableAction(
          onPressed: deleteFunction,
          icon: Icons.delete,
          backgroundColor: Color.fromARGB(255, 5, 246, 13),
          borderRadius: BorderRadius.circular(12),
         )
         ],
         ),
        child: Container(
          padding: EdgeInsets.all(24),
        decoration: BoxDecoration(color: Colors.pink ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted , 
              onChanged: onChanged,
              activeColor: Colors.black,
              ),
        
            Text(
              taskName,
              style: TextStyle(
                decoration: taskCompleted
                 ? TextDecoration.lineThrough 
                 : TextDecoration.none
                 ),
              ),
            ],
            ),
            ),
      ),
    );
  }
}