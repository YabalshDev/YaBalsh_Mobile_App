import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'device.g.dart';

@HiveType(typeId: 50)
class Device extends Equatable {
  @HiveField(1)
  final String? deviceId;
  @HiveField(2)
  final bool? sendToBackend;

  const Device({this.deviceId, this.sendToBackend});

  Device copyWith({String? deviceId, bool? sendToBackend}) => Device(
      deviceId: deviceId ?? this.deviceId,
      sendToBackend: sendToBackend ?? this.sendToBackend);

  @override
  List<Object?> get props => [deviceId, sendToBackend];
}
