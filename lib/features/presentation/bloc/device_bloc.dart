import 'package:flutter_bloc/flutter_bloc.dart';
import 'device_event.dart';
import 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  DeviceBloc() : super(DeviceLoading()) {
    // تسجيل معالجات الأحداث

    // تحميل الأجهزة
    on<LoadDevices>(_onLoadDevices);

    // إضافة جهاز جديد
    on<AddDevice>(_onAddDevice);

    // حذف جهاز
    on<DeleteDevice>(_onDeleteDevice);

    // حجز جهاز
    on<BookDevice>(_onBookDevice);

    // إنهاء الجلسة لجهاز
    on<EndSession>(_onEndSession);
  }

  // معالجة حدث LoadDevices
  void _onLoadDevices(LoadDevices event, Emitter<DeviceState> emit) async {
    try {
      // محاكاة عملية تحميل الأجهزة من قاعدة البيانات
      // افترض أن كل جهاز يمثل كقائمة: [name, type, price, taskCompleted, isBooked]
      List<List<dynamic>> devices = [
        ["Laptop","PC",3000,false,false],
        ["Laptop","PlayStation",4000,false,false],
      ];
      emit(DeviceLoaded(deviceList: devices));
    } catch (_) {
      emit(DeviceError(message: 'Failed to load devices'));
    }
  }

  // معالجة حدث AddDevice
  void _onAddDevice(AddDevice event, Emitter<DeviceState> emit) {
    if (state is DeviceLoaded) {
      final List<List<dynamic>> updatedDeviceList = List.from(
        (state as DeviceLoaded).deviceList,
      );
      updatedDeviceList.add([event.name, event.type, event.price, false, false]);
      emit(DeviceLoaded(deviceList: updatedDeviceList));
    }
  }

  // معالجة حدث DeleteDevice

  void _onDeleteDevice(DeleteDevice event, Emitter<DeviceState> emit) {
    if (state is DeviceLoaded && event.index < (state as DeviceLoaded).deviceList.length) {
      final List<List<dynamic>> updatedDeviceList = List.from(
        (state as DeviceLoaded).deviceList,
      );
      updatedDeviceList.removeAt(event.index);
      emit(DeviceLoaded(deviceList: updatedDeviceList));
    }
  }

  // معالجة حدث BookDevice
  void _onBookDevice(BookDevice event, Emitter<DeviceState> emit) {
    if (state is DeviceLoaded) {
      final List<List<dynamic>> updatedDeviceList = List.from(
        (state as DeviceLoaded).deviceList,
      );
      updatedDeviceList[event.index][4] = true; // تحديث حالة الحجز
      emit(DeviceLoaded(deviceList: updatedDeviceList));
    }
  }

  // معالجة حدث EndSession
  void _onEndSession(EndSession event, Emitter<DeviceState> emit) {
    if (state is DeviceLoaded) {
      final List<List<dynamic>> updatedDeviceList = List.from(
        (state as DeviceLoaded).deviceList,
      );
      updatedDeviceList[event.index][4] = false; // تحديث حالة انتهاء الجلسة
      emit(DeviceLoaded(deviceList: updatedDeviceList));
    }
  }
}
