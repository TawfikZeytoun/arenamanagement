import 'package:flutter/material.dart';

class DropButtonWidget extends StatelessWidget{
  final IconData iconDrop;
  List<DropdownMenuItem<dynamic>> listDropDownMenuItem;
  final dynamic selectedVal;
  String? labelText;
   Function(dynamic ) onChang;

  DropButtonWidget({super.key, required this.iconDrop,required this.listDropDownMenuItem,required this.selectedVal, this.labelText,required this.onChang});
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      dropdownColor: Colors.green,
      borderRadius: BorderRadius.circular(20),
      icon:  Icon(
        iconDrop,
        color: Colors.green,
      ),
      items:listDropDownMenuItem,
      onChanged:onChang,
      value: selectedVal,
      decoration: InputDecoration(

        label:Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("نوع الجهاز",style: TextStyle(color: Colors.grey[700]),),
            SizedBox(
              width: 35,
            ),
          ],
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(20)),
      ),
      validator: (val)=>(val?.isEmpty ?? true)?"Can't be empty":null,
    );
  }
}