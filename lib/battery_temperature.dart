import 'dart:async';

import 'package:flutter/services.dart';

class BatteryTemperature {
  static final _instance = BatteryTemperature._internal();

  BatteryTemperature._internal();

  static BatteryTemperature get instance => _instance;

  static const MethodChannel _channel =
      MethodChannel("pnt/battery_temperature");

  Future<double> get getBatteryTemperature async {
    final double temperature =
        await _channel.invokeMethod('getBatteryTemperature');
    return temperature;
  }
}
