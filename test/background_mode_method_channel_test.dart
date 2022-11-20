import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:background_mode/background_mode_method_channel.dart';

void main() {
  MethodChannelBackgroundMode platform = MethodChannelBackgroundMode();
  const MethodChannel channel = MethodChannel('background_mode');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
