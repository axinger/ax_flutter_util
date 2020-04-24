#import "AxFlutterUtilPlugin.h"
#if __has_include(<ax_flutter_util/ax_flutter_util-Swift.h>)
#import <ax_flutter_util/ax_flutter_util-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ax_flutter_util-Swift.h"
#endif

@implementation AxFlutterUtilPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAxFlutterUtilPlugin registerWithRegistrar:registrar];
}
@end
