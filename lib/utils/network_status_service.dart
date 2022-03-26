import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

enum NetworkStatus { Online, Offline }

class NetworkStatusService {
  StreamController<NetworkStatus> networkStatusController =
      StreamController<NetworkStatus>();

  NetworkStatusService() {
    Connectivity().onConnectivityChanged.listen((status) async {
      networkStatusController.add(await _getNetworkStatus(status));
    });
  }

  Future<NetworkStatus> _getNetworkStatus(ConnectivityResult status) async {
    if (status == ConnectivityResult.mobile ||
        status == ConnectivityResult.wifi ) {
      final result = await DataConnectionChecker().hasConnection;
      if (result) {
        return NetworkStatus.Online;
      } else {
        return NetworkStatus.Offline;
      }
    } else {
      return NetworkStatus.Offline;
    }
  }
}
