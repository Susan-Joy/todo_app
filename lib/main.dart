// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to/pages/home_page.dart';
void main() async {

  await Hive.initFlutter();

var box = await Hive.openBox('mybox');

  runApp(
    const MaterialApp(
      home: HomePage(),
    ),
  );
}

