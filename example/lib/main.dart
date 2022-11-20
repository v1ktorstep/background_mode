import 'package:flutter/material.dart';
import 'dart:async';

import 'package:background_mode/background_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _backgroundMode = BackgroundMode();

  @override
  void initState() {
    super.initState();

    _backgroundMode.beginBackgroundTask().then((taskId) async {
      print('task started: $taskId');
      await Future.delayed(const Duration(seconds: 1));
      await _backgroundMode.endBackgroundTask(taskId);
      print('task ended: $taskId');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
      ),
    );
  }
}
