import 'package:arena_management/features/presentation/widgets/dropdownbuttonwidget.dart';
import 'package:arena_management/features/presentation/widgets/my_button.dart';
import 'package:arena_management/features/presentation/widgets/textformfield.dart';
import 'package:flutter/material.dart';

class DialogSheet extends StatefulWidget {
   TextEditingController nameController=TextEditingController();
   final String? initialSelectedValueDeviceType;
   TextEditingController priceController=TextEditingController();
   final TextEditingController typeController;
   VoidCallback onSave;
  VoidCallback onCancel;
   DialogSheet({super.key, required this.nameController,required this.typeController,required this.onSave,required this.onCancel,required this.priceController, this.initialSelectedValueDeviceType});

  @override
  State<DialogSheet> createState() => _DialogSheetState();
}

class _DialogSheetState extends State<DialogSheet> {

  String? selectedValueDeviceType;
  @override
  void initState() {
    selectedValueDeviceType = widget.initialSelectedValueDeviceType;
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,right: 20,left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormFieldWidget(myController:widget.nameController , type:TextInputType.name , suffixIcon:Icons.laptop, name: 'اسم الجهاز', ),
              SizedBox(
                height: 40,
              ),
              DropButtonWidget(
                  iconDrop:Icons.merge_type,
                  listDropDownMenuItem:[
                    DropdownMenuItem(
                    value: "PC",
                    child: Container(
                      child: Text(
                        "PC",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ) ,
                    DropdownMenuItem(
                      value: "PlayStation",
                      child: Container(
                        child: Text(
                          "PlayStation",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                         ),
                      ),
                    ) ,
                    DropdownMenuItem(
                      value: "XBox",
                      child: Container(
                        child: Text(
                          "XBox",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ) ,
                  ],
                  selectedVal:selectedValueDeviceType,
                  onChang:( val) {
                      setState(() {
                        selectedValueDeviceType = val;
                        widget.typeController.text = val;
                        print("hhhhhhhhhh${selectedValueDeviceType }");
                      });

                  },

              ),
              SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(myController:widget.priceController , type:TextInputType.number , suffixIcon:Icons.attach_money, name: 'سعر الساعة', ),
              Container(
                  width: double.infinity,
                  child: MyButton(text: "Save", onPressed:widget.onSave)),
            ],
          ),
        ),
      );
  }
}
