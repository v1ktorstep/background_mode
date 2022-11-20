import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'background_mode_platform_interface.dart';

/// An implementation of [BackgroundModePlatform] that uses method channels.
class MethodChannelBackgroundMode extends BackgroundModePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('background_mode');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
