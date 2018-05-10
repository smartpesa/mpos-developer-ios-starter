//
//  VerifyMerchantResposne.h
//  SmartPesaSDK
//
//  Created by Arun on 15/2/16.
//  Copyright © 2016 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmartPesaBaseResponse.h"

@class VerifyMerchantInfo;

@interface VerifyMerchantResposne : SmartPesaBaseResponse

@property(nonatomic, strong)VerifyMerchantInfo *verifyMerchantInfo;

- (id)initWithDictionary:(NSDictionary *)dict withResposneCode:(NSInteger)resposneCode andResponseMessage:(NSString *)message;

@end
