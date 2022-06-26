import 'dart:async';
import 'dart:io';
import '../core/connectivity_contracts.dart';


class ConnectivityService implements ConnectivityContract {
  final String _pingUrl;

  ConnectivityService(this._pingUrl);

  @override
  Future<bool> hasInternetConnectivity() async {
    Completer<bool> value = Completer<bool>();
    try {
      final result = await InternetAddress.lookup(_pingUrl);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        value.complete(true);
      } else {
        value.complete(false);
      }
    } on SocketException catch (_) {
      value.complete(false);
    }
    return value.future;
  }
}
