//
//  VerifyMerchantError.h
//  SmartPesaSDK
//
//  Created by Arun on 15/2/16.
//  Copyright © 2016 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmartPesaBaseResponse.h"

typedef enum {
    VERIFY_MERCHANT_ERROR,
    VERIFY_MERCHANT_REQUEST_INPUT,
    
} ErrorReason;

@interface VerifyMerchantError : SmartPesaBaseResponse

@property(nonatomic)ErrorReason mErrorReason;

- (id)initVerifyMerchantError:(NSString *)detailMessge :(ErrorReason)errorReason;

@end


