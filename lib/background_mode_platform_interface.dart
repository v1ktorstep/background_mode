import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'background_mode_method_channel.dart';

abstract class BackgroundModePlatform extends PlatformInterface {
  /// Constructs a BackgroundModePlatform.
  BackgroundModePlatform() : super(token: _token);

  static final Object _token = Object();

  static BackgroundModePlatform _instance = MethodChannelBackgroundMode();

  /// The default instance of [BackgroundModePlatform] to use.
  ///
  /// Defaults to [MethodChannelBackgroundMode].
  static BackgroundModePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BackgroundModePlatform] when
  /// they register themselves.
  static set instance(BackgroundModePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int> beginBackgroundTask() {
    throw UnimplementedError('beginBackgroundTask() has not been implemented.');
  }

  Future<void> endBackgroundTask(int taskId) {
    throw UnimplementedError('endBackgroundTask() has not been implemented.');
  }
}
