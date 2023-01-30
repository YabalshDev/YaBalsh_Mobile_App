import '../../features/addresses/domain/entities/address.dart';
import '../depedencies.dart';
import '../services/zone_service.dart';

List<Address> getZoneAddress(List<Address> addresses) {
  final currentZone = getIt<ZoneService>().currentSubZone;
  final zoneAddresses = addresses
      .where(
        (element) => element.zone == currentZone!.name,
      )
      .toList();
  return zoneAddresses;
}
