import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget{
  TextEditingController myController=TextEditingController();
  TextInputType type;
  IconData suffixIcon;
  bool obscure;
  bool enableTextForm;
  TextAlign textAlignDir;
  Function()? onTapFunc;
  String name;
  TextFormFieldWidget(
      {this.textAlignDir=TextAlign.right,
        this.onTapFunc,
        this.obscure=false,
        this.enableTextForm=true,
        required this.myController,
        required this.type,
        required this.suffixIcon,
        required this.name,
        super.key});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enableTextForm,
      validator: (val)=>val!.isEmpty?"Can't be empty":null,
      controller: myController,
      minLines: 1,
      textAlign: textAlignDir,
      onTap: onTapFunc,
      cursorColor: Colors.green,
      obscureText: obscure,
      keyboardType: type,
      decoration: InputDecoration(
        hintText: name,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide:
              const BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(20)),
          suffixIcon:Icon(
            suffixIcon,
            color: Colors.green,
          ),
          floatingLabelStyle: const TextStyle(
              color: Colors.green
          )
      ),
    );
  }

}