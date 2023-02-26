part of 'settings_cubit_cubit.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class IsNearStoresState extends SettingsState {
  final bool isNearStores;

  const IsNearStoresState({required this.isNearStores});
  @override
  List<Object> get props => [isNearStores];
}
