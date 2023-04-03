import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool  completed;
  Function(bool?)? onChanged;

   TodoTile({super.key,required this.taskName,required this.completed,required this.onChanged});


  @override
  Widget build(BuildContext context) {
    return Padding(
         padding:const EdgeInsets.only(left: 25,right: 25,top:25) ,
         child:  Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:Colors.yellow,
              borderRadius: BorderRadius.circular(12)
              ),
            child:Row(
              children: [
                //checkbox
                Checkbox(
                  value: completed,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                //task name
                Text(
                  taskName,
                  style:  TextStyle(
                      decoration: completed 
                      ? TextDecoration.lineThrough 
                      :TextDecoration.none
                    ),
                
                )

            ]),
      ),
       
    );  
  }
}