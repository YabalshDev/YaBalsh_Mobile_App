part of 'connectivty_cubit.dart';

class ConnectivtyState extends Equatable {
  final bool? isConnected;
  const ConnectivtyState({this.isConnected = true});

  @override
  List<Object> get props => [isConnected!];
}
