//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<agora_rtc_engine/AgoraRtcEnginePlugin.h>)
#import <agora_rtc_engine/AgoraRtcEnginePlugin.h>
#else
@import agora_rtc_engine;
#endif

#if __has_include(<permission_handler/PermissionHandlerPlugin.h>)
#import <permission_handler/PermissionHandlerPlugin.h>
#else
@import permission_handler;
#endif

#if __has_include(<url_launcher/UrlLauncherPlugin.h>)
#import <url_launcher/UrlLauncherPlugin.h>
#else
@import url_launcher;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AgoraRtcEnginePlugin registerWithRegistrar:[registry registrarForPlugin:@"AgoraRtcEnginePlugin"]];
  [PermissionHandlerPlugin registerWithRegistrar:[registry registrarForPlugin:@"PermissionHandlerPlugin"]];
  [FLTUrlLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTUrlLauncherPlugin"]];
}

@end
