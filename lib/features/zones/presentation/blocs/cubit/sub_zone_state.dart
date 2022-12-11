part of 'sub_zone_cubit.dart';

class SubZoneState extends Equatable {
  final RequestState? subZonesState;
  final List<SubZone>? subZones;
  final String? errorMessage;
  const SubZoneState(
      {this.subZonesState = RequestState.loading,
      this.subZones = const [],
      this.errorMessage = ''});

  SubZoneState copyWith(
      {RequestState? subZonesState,
      List<SubZone>? subZones,
      String? errorMessage}) {
    return SubZoneState(
        errorMessage: errorMessage ?? this.errorMessage,
        subZones: subZones ?? this.subZones,
        subZonesState: subZonesState ?? this.subZonesState);
  }

  @override
  List<Object> get props => [
        subZonesState!,
        subZones!,
        errorMessage!,
      ];
}
