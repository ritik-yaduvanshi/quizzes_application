import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class ConnectionProvider with ChangeNotifier {
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  bool _isConnected = false;

  bool get isConnected => _isConnected;

  ConnectionProvider() {
    Connectivity().onConnectivityChanged.listen((event) {
      resultHandler(event);
    });
  }

  Future<void> resultHandler(ConnectivityResult result) async {
    _connectivityResult = result;
    if (_connectivityResult == ConnectivityResult.none) {
      _isConnected = false;
    } else {
      _isConnected = true;
    }
    notifyListeners();
  }

  void initialConnection() async {
    ConnectivityResult connectivityResult =
    await (Connectivity().checkConnectivity());
    resultHandler(connectivityResult);
  }
}