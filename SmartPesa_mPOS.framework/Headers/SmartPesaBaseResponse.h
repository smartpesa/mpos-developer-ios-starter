//
//  SmartPesaBaseResponse.h
//  SmartPesaSDK
//
//  Created by Arun on 8/3/15.
//  Copyright (c) 2015 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ResponseStatus;

@interface SmartPesaBaseResponse : NSObject

@property(nonatomic, strong)ResponseStatus *resposne;
@property(nonatomic, strong)NSString *detailMessage;

- (id)initWithDictionary:(NSDictionary *)dict withResposneCode:(NSInteger)resposneCode andResponseMessage:(NSString *)message;
- (id)initWithDictionary:(NSDictionary *)dict;

@end
