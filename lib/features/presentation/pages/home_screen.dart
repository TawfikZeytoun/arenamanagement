import 'dart:async';

import 'package:arena_management/features/data/datasources/database.dart';
import 'package:arena_management/features/presentation/bloc/device_state.dart';
import 'package:arena_management/features/presentation/widgets/dialog_sheet.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import '../bloc/device_bloc.dart';
import '../bloc/device_event.dart';
import '../widgets/game_tile.dart';
class HomeScreen extends StatefulWidget{
  static const routeName = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DeviceDataBase db = DeviceDataBase();
  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  final _priceController = TextEditingController();
  final _hoursController = TextEditingController();
  final _myBox = Hive.box("game_box");
  void _editDevice(BuildContext context, int index, List device) {
    _nameController.text = device[0];
    _typeController.text = device[1];
    _priceController.text = device[2].toString();
    showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) =>
          DialogSheet(
            typeController: _typeController,
            nameController: _nameController,
            priceController: _priceController,
            onSave: () {
               context.read<DeviceBloc>().add(AddDevice(
                 name: _nameController.text,
                 type: _typeController.text,
                 price: int.tryParse(_priceController.text) ?? 0,
               ));
              Navigator.of(context).pop();
            },
            onCancel: () => Navigator.of(context).pop(),
            initialSelectedValueDeviceType: _typeController.text.isEmpty
                ? "PC"
                : _typeController.text,
          ),
    );
  }
  void _createNewDevice(BuildContext context) {
    _nameController.clear();
    _typeController.clear();
    _priceController.clear();
    showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) =>
          DialogSheet(
            typeController: _typeController,
            nameController: _nameController,
            priceController: _priceController,
            onSave: () {
              context.read<DeviceBloc>().add(AddDevice(
                name: _nameController.text,
                type: _typeController.text,
                price: int.tryParse(_priceController.text) ?? 0,
              ));
              Navigator.of(context).pop();
            },
            onCancel: () => Navigator.of(context).pop(),
            initialSelectedValueDeviceType: _typeController.text.isEmpty
                ? null
                : _typeController.text,
          ),
    );
  }

  // void _bookDevice(BuildContext context, int index, List device) {
  //   // فتح نافذة لإدخال عدد الساعات
  //   showModalBottomSheet(
  //     showDragHandle: true,
  //     isScrollControlled: true,
  //     context: context,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
  //     ),
  //     builder: (context) => Padding(
  //       padding: EdgeInsets.only(
  //         bottom: MediaQuery.of(context).viewInsets.bottom,
  //         left: 20,
  //         right: 20,
  //         top: 20,
  //       ),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text('اختر عدد الساعات'),
  //           TextField(
  //             controller: _hoursController,
  //             keyboardType: TextInputType.number,
  //             decoration: InputDecoration(
  //               labelText: 'عدد الساعات',
  //             ),
  //           ),
  //           SizedBox(height: 20),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               ElevatedButton(
  //                 onPressed: () {
  //                   final hours = int.tryParse(_hoursController.text) ?? 1;
  //                   final totalPrice = hours * (int.tryParse(device[2].toString()) ?? 0);
  //
  //                   Navigator.of(context).pop(); // أغلق النافذة أولاً
  //
  //                   // بعد إغلاق النافذة، قم بتحديث الحالة
  //                   WidgetsBinding.instance.addPostFrameCallback((_) {
  //                    if(mounted){
  //                      context.read<DeviceBloc>().add(BookDevice(index: index, hours: hours));
  //                    }
  //
  //                   //  إعداد المؤقت لإنهاء الجلسة//
  //                     Timer(Duration(hours: hours), () {
  //                       if(mounted){
  //                       AwesomeNotifications().createNotification(
  //                         content: NotificationContent(
  //                           id: index,
  //                           channelKey: 'basic_channel',
  //                           title: 'انتهت الجلسة',
  //                           body: 'انتهت الجلسة! الكلفة الكلية: $totalPrice ل.س',
  //                         ),
  //                       );
  //                      if(mounted){
  //                        context.read<DeviceBloc>().add(EndSession(index: index));
  //                      }
  //                     }});
  //                   });
  //                 },
  //                 child: Text('احجز'),
  //               ),
  //               ElevatedButton(
  //                 onPressed: () => Navigator.of(context).pop(),
  //                 child: Text('إلغاء'),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  void initState() {
    super.initState();


      if (_myBox.get("DEVICELIST") == null) {
        db.createInitialData();

      }else{
        db.loadData();
      }
      // if(mounted){
      //   context.read<DeviceBloc>().add(LoadDevices());
      // }


  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
            child: BlocBuilder<DeviceBloc,DeviceState>(
            builder: (context, state) {
              print(state);
              if (state is DeviceLoading) {
                print("Hello every body");
                return Center(child: CircularProgressIndicator());
              } else if (state is DeviceLoaded) {
                print('DeviceLoaded state:Tawfik ${state.deviceList}');
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("الأجهزة", style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.deviceList.length,
                          itemBuilder: (context, index) {
                            return GameTile(
                              editFunction: (context) {
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  _editDevice(context, index, state.deviceList[index]);
                                });

                              },
                              // _editDevice(context, index, state.deviceList[index]),
                              type: state.deviceList[index][1],
                              hourPrice: int.tryParse(
                                  state.deviceList[index][2].toString()) ?? 0,
                              name: state.deviceList[index][0],
                              taskCompleted: state.deviceList[index][3],
                              onChanged: (value) {
                                print("Updated: ${state.deviceList[index][1]}");
                              },
                              deleteFunction: (context) {
                                 // context.read<DeviceBloc>().add(DeleteDevice(index: index)) ;
                              },
                              bookFunction: (context) {
                               // _bookDevice(context, index, state.deviceList[index]);
                              },
                              isBooked: state.deviceList[index][4] ?? false,
                            );
                          },

                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: Text('Something went wrong!'));
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () => _createNewDevice(context),
          child: Icon(Icons.add,color: Colors.white,),

        ),
      );
    }
}