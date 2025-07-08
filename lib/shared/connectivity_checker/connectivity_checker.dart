import 'dart:io';

import 'package:flutter/foundation.dart';

class ConnectivityChecker {
  Future<bool> hasConection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty &&
          result.where((item) => item.rawAddress.isNotEmpty).firstOrNull !=
              null) {
        return true;
      }
      return false;
    } on Exception catch (ex) {
      if (kDebugMode) {
        print('Error hasConection: not connected');
        print(ex.toString());
      }
      return false;
    }
  }
}
