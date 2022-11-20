import 'package:flutter_test/flutter_test.dart';
import 'package:background_mode/background_mode.dart';
import 'package:background_mode/background_mode_platform_interface.dart';
import 'package:background_mode/background_mode_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBackgroundModePlatform
    with MockPlatformInterfaceMixin
    implements BackgroundModePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BackgroundModePlatform initialPlatform = BackgroundModePlatform.instance;

  test('$MethodChannelBackgroundMode is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBackgroundMode>());
  });

  test('getPlatformVersion', () async {
    BackgroundMode backgroundModePlugin = BackgroundMode();
    MockBackgroundModePlatform fakePlatform = MockBackgroundModePlatform();
    BackgroundModePlatform.instance = fakePlatform;

    expect(await backgroundModePlugin.getPlatformVersion(), '42');
  });
}
