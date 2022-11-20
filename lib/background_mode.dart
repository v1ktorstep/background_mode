import 'background_mode_platform_interface.dart';

class BackgroundMode {
  Future<int> beginBackgroundTask() {
    return BackgroundModePlatform.instance.beginBackgroundTask();
  }

  Future<void> endBackgroundTask(int taskId) {
    return BackgroundModePlatform.instance.endBackgroundTask(taskId);
  }
}
