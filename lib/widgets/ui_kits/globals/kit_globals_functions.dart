import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class KitGlobalsFunctions {
  Future<bool> connection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // nao tem conexao
      return false;
    } else {
      // tem conexao
      return true;
    }
  }
}
