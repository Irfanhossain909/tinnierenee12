
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tinnierenee12/my_app.dart';

void main() async {
  await GetStorage.init();
  // runApp(const MyApp());
  runApp(
    MyApp(),
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(), // Wrap your app
    // ),
  );
}
