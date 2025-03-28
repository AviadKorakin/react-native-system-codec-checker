#import "SystemCodecChecker.h"
#import "SystemCodecChecker-Swift.h"

@implementation SystemCodecChecker

RCT_EXPORT_MODULE()

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params {
    return std::make_shared<facebook::react::NativeSystemCodecCheckerSpecJSI>(params);
}

- (nonnull NSNumber *)isAudioCodecSupported:(nonnull NSString *)audioCodecType forEncoder:(BOOL)forEncoder {
    BOOL result = [SystemCodecCheckerObjC isAudioCodecSupportedObjC:audioCodecType forEncoder:forEncoder];
    return @(result);
}

- (nonnull NSNumber *)isCodecConfigurationSupported:(nonnull NSString *)videoCodecType pixelFormat:(nonnull NSString *)pixelFormat audioCodecType:(nonnull NSString *)audioCodecType {
    BOOL result = [SystemCodecCheckerObjC isCodecConfigurationSupportedObjC:videoCodecType
                                                                  pixelFormat:pixelFormat
                                                                 audioCodecType:audioCodecType];
    return @(result);
}

- (nonnull NSNumber *)isVideoCodecSupported:(nonnull NSString *)videoCodecType pixelFormat:(nonnull NSString *)pixelFormat forEncoder:(BOOL)forEncoder {
    BOOL result = [SystemCodecCheckerObjC isVideoCodecSupportedObjC:videoCodecType
                                                         pixelFormat:pixelFormat
                                                          forEncoder:forEncoder];
    return @(result);
}
@end