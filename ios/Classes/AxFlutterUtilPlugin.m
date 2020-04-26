#import "AxFlutterUtilPlugin.h"

@implementation AxFlutterUtilPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"ax_flutter_util"
            binaryMessenger:[registrar messenger]];
  AxFlutterUtilPlugin* instance = [[AxFlutterUtilPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];

}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {

    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else if([@"key_chain_set" isEqualToString:call.method]){

        NSString *key =call.arguments[@"key"];
        NSString *value =call.arguments[@"value"];

        [NSUserDefaults.standardUserDefaults setObject:value forKey:key];
        BOOL reslut = NSUserDefaults.standardUserDefaults.synchronize;

        result (@(reslut));
    } else if([@"key_chain_get" isEqualToString:call.method]){

        NSString *key =call.arguments[@"key"];

        id value = [NSUserDefaults.standardUserDefaults objectForKey:key];

        result (value);
    } else if([@"key_chain_remove" isEqualToString:call.method]){

        NSString *key =call.arguments[@"key"];
        [NSUserDefaults.standardUserDefaults removeObjectForKey:key];
        BOOL reslut = NSUserDefaults.standardUserDefaults.synchronize;
        result (@(reslut));

    }else {
        result(FlutterMethodNotImplemented);
    }
}

@end
