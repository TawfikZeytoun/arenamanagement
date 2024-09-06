import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class GameTile extends StatelessWidget{
  final String name;
  final bool taskCompleted;
  final String  type;
  final int hourPrice;
  final bool isBooked;
final Function(bool?)? onChanged;
final Function(BuildContext) deleteFunction;
  final Function(BuildContext) editFunction;
  final Function(BuildContext) bookFunction;
   GameTile({super.key,
     required this.name,
     required this.taskCompleted,
     required this.onChanged,
     required this.deleteFunction,
     required this.hourPrice,
     required this.type,
     required this.editFunction,
     required this.bookFunction,
     required this.isBooked
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion:StretchMotion() ,
          children: [
SlidableAction(
  onPressed: deleteFunction(context),
  icon: Icons.delete,
  backgroundColor: Colors.red,
  borderRadius: BorderRadius.circular(10),
),
          ],
        ),
        startActionPane:ActionPane(
          motion:StretchMotion() ,
          children: [
            SlidableAction(
              onPressed: editFunction(context),
              icon: Icons.edit,
              backgroundColor: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(4, 4), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                isBooked ? Icons.play_arrow : Icons.stop,
                color: isBooked ? Colors.green : Colors.red,
              ),
             Spacer(),
             SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
                   Text(name,style: TextStyle(fontSize: 16),),
                   Row(
                     children: [
                       Text(
                         "ل.س/ساعة",
                       ),
                       SizedBox(
                         width: 3,
                       ),
                       Text(
                         "${hourPrice.toString()}"
                       ),
                       IconButton(
                         icon: Icon(Icons.play_arrow),
                         onPressed: () => bookFunction(context),
                       ),
                     ],
                   ),
                 ],
               ),
             ),
              SizedBox(
                width: 30,
              ),
              type=="PC"? Icon(Icons.laptop):type=="PlayStation"?Icon(Icons.gamepad):type=="XBox"?Icon(Icons.smart_screen_rounded):SizedBox()

            ],
          ),
        ),
      ),
    );
  }

}