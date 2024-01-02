import 'dart:async';

import 'package:flutter/foundation.dart';

class AppDebouncer {
  final int milliseconds;
  Timer? _timer;

  AppDebouncer({required this.milliseconds});

  Future<bool> run(VoidCallback action, String v) {
    if (v.isNotEmpty) {
      // mengecek apakah v tidak kosong
      _timer?.cancel();
      _timer = Timer(Duration(milliseconds: milliseconds), action);
      return Future.value(true);
    } else {
      // jika v kosong maka akan di cancel
      _timer?.cancel();

      _timer = null;
      return Future.value(false);
    }
  }
}
