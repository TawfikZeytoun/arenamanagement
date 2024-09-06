import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  final String text;
  VoidCallback onPressed;

  MyButton({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 50,
     margin: EdgeInsets.only(top: 20,bottom: 20),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius:BorderRadius.circular(20),
        border: Border.all(),
      ),
      child: MaterialButton(
          onPressed:onPressed,
        minWidth:200,
        child: Text(text,style: TextStyle(color: Colors.white),),
      ),
    );
  }

}