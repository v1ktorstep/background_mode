#import "BackgroundModePlugin.h"
#if __has_include(<background_mode/background_mode-Swift.h>)
#import <background_mode/background_mode-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "background_mode-Swift.h"
#endif

@implementation BackgroundModePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBackgroundModePlugin registerWithRegistrar:registrar];
}
@end
