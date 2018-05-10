//
//  GetVersionResponse.h
//  SmartPesaSDK
//
//  Created by Arun on 15/2/16.
//  Copyright © 2016 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmartPesaBaseResponse.h"

@class VersionInfo;

@interface GetVersionResponse : SmartPesaBaseResponse

@property(nonatomic, strong)VersionInfo *mVersionInfo;

- (id)initWithDictionary:(NSDictionary *)dict withResposneCode:(NSInteger)resposneCode andResponseMessage:(NSString *)message;

@end
