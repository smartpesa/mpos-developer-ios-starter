//
//  SendNotificationError.h
//  SmartPesaSDK
//
//  Created by Arun on 16/2/16.
//  Copyright © 2016 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmartPesaBaseResponse.h"

typedef enum {
    INVALID_INPUT,
    NOTIFICATION_ERROR
    
} SendNotificationErrorReason;

@interface SendNotificationError : SmartPesaBaseResponse

@property(nonatomic)SendNotificationErrorReason mErrorReason;

- (id)initSendNotificationError:(NSString *)detailMessge :(SendNotificationErrorReason)errorReason;

@end
