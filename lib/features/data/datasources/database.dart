import 'package:hive_flutter/adapters.dart';
class DeviceDataBase{
  List<dynamic> deviceList=[];
  final _myBox=Hive.box("game_box");
void createInitialData(){
  deviceList=[
    ["Laptop","PC",3000,false,false],
    ["Laptop","PlayStation",4000,false,false],

  ];
}

void loadData(){
deviceList=_myBox.get("DEVICELIST");
for (var device in deviceList) {
  if (device.length == 4) {
    device.add(false);
  }
}
}

void updateData(){
_myBox.put("DEVICELIST", deviceList);
print('Data updated in Hive box: ${deviceList}');
}

}
