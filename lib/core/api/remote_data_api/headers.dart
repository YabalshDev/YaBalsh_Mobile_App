import '../../depedencies.dart';
import '../../services/user_service.dart';
import '../../services/zone_service.dart';

class ApiHeaders {
  static Map<String, dynamic> zoneHeaders = {
    'zone': getIt<ZoneService>().getCurrentSubZone()!.id,
    'authorization': 'Bearer ${getIt<UserService>().token}'
  };

  static Map<String, dynamic> authorizationHeaders = {
    'authorization': 'Bearer ${getIt<UserService>().token}'
  };
}
