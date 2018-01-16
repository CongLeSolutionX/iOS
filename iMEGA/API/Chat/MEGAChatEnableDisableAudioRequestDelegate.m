
#import "MEGAChatEnableDisableAudioRequestDelegate.h"

@interface MEGAChatEnableDisableAudioRequestDelegate ()

@property (nonatomic, copy) void (^completion)(MEGAChatError *error);

@end

@implementation MEGAChatEnableDisableAudioRequestDelegate

#pragma mark - Initialization

- (instancetype)initWithCompletion:(void (^)(MEGAChatError *error))completion {
    self = [super init];
    if (self) {
        _completion = completion;
    }
    
    return self;
}

#pragma mark - MEGAChatRequestDelegate

- (void)onChatRequestStart:(MEGAChatSdk *)api request:(MEGAChatRequest *)request {
    [super onChatRequestStart:api request:request];
}

- (void)onChatRequestFinish:(MEGAChatSdk *)api request:(MEGAChatRequest *)request error:(MEGAChatError *)error {
    [super onChatRequestFinish:api request:request error:error];
    
    if (self.completion) {
        self.completion(error);
    }
}

@end
