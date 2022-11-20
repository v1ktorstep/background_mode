import Flutter
import UIKit

private let methodChannelName = "platform_method_channel/background_mode"

public class SwiftBackgroundModePlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: methodChannelName, binaryMessenger: registrar.messenger())
        let instance = SwiftBackgroundModePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == "beginBackgroundTask") {
            var taskId = UIBackgroundTaskIdentifier(rawValue: 0)
            taskId = UIApplication.shared.beginBackgroundTask(expirationHandler: {
                UIApplication.shared.endBackgroundTask(taskId);
            })
            result(taskId.rawValue)
        } else if (call.method == "endBackgroundTask") {
            UIApplication.shared.endBackgroundTask(UIBackgroundTaskIdentifier(rawValue: call.arguments as! Int))
            result(nil)
        }
    }
}
