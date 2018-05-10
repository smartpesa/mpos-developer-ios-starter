//
//  SendNotificationResponse.h
//  SmartPesaSDK
//
//  Created by Arun on 16/2/16.
//  Copyright © 2016 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmartPesaBaseResponse.h"

@interface SendNotificationResponse : SmartPesaBaseResponse

@property(nonatomic)BOOL mStatus;

- (id)initWithDictionary:(NSDictionary *)dict withResposneCode:(NSInteger)resposneCode andResponseMessage:(NSString *)message;


@end
