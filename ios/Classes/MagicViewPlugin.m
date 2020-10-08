#import "MagicViewPlugin.h"
#if __has_include(<magic_view_plugin/magic_view_plugin-Swift.h>)
#import <magic_view_plugin/magic_view_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "magic_view_plugin-Swift.h"
#endif

@implementation MagicViewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMagicViewPlugin registerWithRegistrar:registrar];
}
@end
