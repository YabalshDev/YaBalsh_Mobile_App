part of 'main_zones_cubit.dart';

class MainZonesState extends Equatable {
  final RequestState? zonesHistoryState;
  final List<SubZone>? zonesHistory;
  final String? errorMessage;
  const MainZonesState(
      {this.zonesHistoryState = RequestState.loading,
      this.zonesHistory = const [],
      this.errorMessage = ''});

  MainZonesState copyWith(
      {RequestState? zonesHistoryState,
      List<SubZone>? zonesHistory,
      String? errorMessage}) {
    return MainZonesState(
        errorMessage: errorMessage ?? this.errorMessage,
        zonesHistory: zonesHistory ?? this.zonesHistory,
        zonesHistoryState: zonesHistoryState ?? this.zonesHistoryState);
  }

  @override
  List<Object> get props => [
        zonesHistoryState!,
        zonesHistory!,
        errorMessage!,
      ];
}
