import 'dart:async';

import 'package:flutter/material.dart';

import 'battery_temperature.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _temp = "";

  Future<void> initDeviceTemperature() async {
    double temp;
    try {
      temp = await BatteryTemperature.instance.getBatteryTemperature;
    } catch (e) {
      temp = 0.0;
    }

    if (!mounted) return;

    setState(() {
      _temp = "Current Device Temperature is $temp degree Celsius";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Battery Temperature'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(15),
                child: Text(_temp),
              ),
              TextButton(
                onPressed: initDeviceTemperature,
                child: const Text("Get Device Temperature"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
