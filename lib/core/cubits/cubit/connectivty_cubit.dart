import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'connectivty_state.dart';

class ConnectivtyCubit extends Cubit<ConnectivtyState> {
  final Connectivity connectivity;
  ConnectivtyCubit({required this.connectivity})
      : super(const ConnectivtyState());

  void setConnectionStatus(bool status) =>
      emit(ConnectivtyState(isConnected: status));

  void handleStatus(ConnectivityResult result) async =>
      getConnectionStatus(result);

  void getIntitalConnectionStatus() async {
    final result = await connectivity.checkConnectivity();
    handleStatus(result);
  }

  Future<bool> checkConnection() async {
    try {
      final res =
          await InternetAddress.lookup('www.google.com'); // lookup a site
      final result = res.isNotEmpty && res[0].rawAddress.isNotEmpty;
      return result; //true if result is not empty
    } catch (err) {
      return false;
    }
  }

  void getConnectionStatus(ConnectivityResult result) async {
    bool isConnected = true;
    if (result == ConnectivityResult.none) {
      isConnected = false; // no connection
    } else if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      final status =
          await checkConnection(); // check connection while wifi or data

      if (status) {
        isConnected = true; // connection exits
      }
    }

    emit(ConnectivtyState(isConnected: isConnected));
  }
}
