import 'package:equatable/equatable.dart';
abstract class DeviceEvent extends Equatable {
  const DeviceEvent();

  @override
  List<Object?> get props => [];
}

class LoadDevices extends DeviceEvent {}

class AddDevice extends DeviceEvent {
  final String name;
  final String type;
  final int price;

  AddDevice({required this.name, required this.type, required this.price});

  @override
  List<Object?> get props => [name, type, price];
}

class EditDevice extends DeviceEvent {
  final int index;
  final String name;
  final String type;
  final int price;

  EditDevice({required this.index, required this.name, required this.type, required this.price});

  @override
  List<Object?> get props => [index, name, type, price];
}

class DeleteDevice extends DeviceEvent {
  final int index;

  DeleteDevice({required this.index});

  @override
  List<Object?> get props => [index];
}
class BookDevice extends DeviceEvent {
  final int index;
  final int hours;

  const BookDevice({required this.index, required this.hours});

  @override
  List<Object?> get props => [index, hours];
}
class EndSession extends DeviceEvent {
  final int index;

  const EndSession({required this.index});

  @override
  List<Object?> get props => [index];
}