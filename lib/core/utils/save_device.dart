import '../../features/home/domain/entities/device.dart';
import '../depedencies.dart';
import '../services/device_service.dart';
import 'notification_helper.dart';

void saveDevice({required bool sendToBackEnd}) async {
  final deviceId = await NotificationHelper.getDeviceId();
  if (deviceId.isNotEmpty) {
    final device = Device(deviceId: deviceId, sendToBackend: sendToBackEnd);
    getIt<DeviceService>().saveDeviceToLocalStorage(device);
    getIt<DeviceService>().setCurrentDevice(device);
  }
}
