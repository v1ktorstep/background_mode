
import 'background_mode_platform_interface.dart';

class BackgroundMode {
  Future<String?> getPlatformVersion() {
    return BackgroundModePlatform.instance.getPlatformVersion();
  }
}
