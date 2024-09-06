import 'package:equatable/equatable.dart';

abstract class DeviceState extends Equatable {
  const DeviceState();

  @override
  List<Object?> get props => [];
}

class DeviceLoading extends DeviceState {}

class DeviceLoaded extends DeviceState {
  final List<List<dynamic>> deviceList;

  DeviceLoaded({required this.deviceList});

  @override
  List<Object?> get props => [deviceList];
}

class DeviceError extends DeviceState {
  String message;
  DeviceError({required this.message});
}
