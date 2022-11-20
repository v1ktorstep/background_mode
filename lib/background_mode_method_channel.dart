import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'background_mode_platform_interface.dart';

const _methodChannelName = 'platform_method_channel/background_mode';

/// An implementation of [BackgroundModePlatform] that uses method channels.
class MethodChannelBackgroundMode extends BackgroundModePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(_methodChannelName);

  @override
  Future<int> beginBackgroundTask() async {
    final result = await methodChannel.invokeMethod<int>('beginBackgroundTask');
    return result!;
  }

  @override
  Future<void> endBackgroundTask(int taskId) async {
    await methodChannel.invokeMethod('endBackgroundTask', taskId);
  }
}
