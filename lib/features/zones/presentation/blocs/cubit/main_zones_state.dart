part of 'main_zones_cubit.dart';

class MainZonesState extends Equatable {
  final RequestState? zonesHistoryState;
  final List<SubZone>? zonesHistory;
  final String? zonesHistoryErrorMessage;
  final RequestState? mainZonesState;
  final List<MainZone>? mainZones;
  final String? mainZonesErrorMessage;
  const MainZonesState(
      {this.mainZonesState = RequestState.loading,
      this.mainZones = const [],
      this.mainZonesErrorMessage = '',
      this.zonesHistoryState = RequestState.loading,
      this.zonesHistory = const [],
      this.zonesHistoryErrorMessage = ''});

  MainZonesState copyWith(
      {RequestState? zonesHistoryState,
      List<SubZone>? zonesHistory,
      String? zonesHistoryErrorMessage,
      RequestState? mainZonesState,
      List<MainZone>? mainZones,
      String? mainZonesErrorMessage}) {
    return MainZonesState(
        mainZones: mainZones ?? this.mainZones,
        mainZonesErrorMessage:
            mainZonesErrorMessage ?? this.mainZonesErrorMessage,
        mainZonesState: mainZonesState ?? this.mainZonesState,
        zonesHistoryErrorMessage:
            zonesHistoryErrorMessage ?? this.zonesHistoryErrorMessage,
        zonesHistory: zonesHistory ?? this.zonesHistory,
        zonesHistoryState: zonesHistoryState ?? this.zonesHistoryState);
  }

  @override
  List<Object> get props => [
        zonesHistoryState!,
        zonesHistory!,
        zonesHistoryErrorMessage!,
        mainZones!,
        mainZonesState!,
        mainZonesErrorMessage!
      ];
}
