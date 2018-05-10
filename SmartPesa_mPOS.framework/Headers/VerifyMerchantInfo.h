//
//  User.h
//  SmartPesa
//
//  Created by Arun on 21/2/15.
//  Copyright (c) 2015 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Currency;
@class PlatformPermission;
@class ProfilePermission;



@interface VerifyMerchantInfo : NSObject

@property(nonatomic, strong)NSString *mCountry;
@property(nonatomic, strong)NSString *mDefaultDialingCode;
@property(nonatomic, strong)NSString *mEmailAddress;
@property(nonatomic, strong)NSString *mMerchantCode;
@property(nonatomic, strong)NSString *mMerchantId;
@property(nonatomic, strong)NSString *mBankName;
@property(nonatomic, strong)NSString *mMerchantName;
@property(nonatomic, strong)NSString *mOperatorId;
@property(nonatomic, strong)NSString *mOperatorCode;
@property(nonatomic, strong)NSString *mOperatorName;
@property(nonatomic, strong)NSString *mAccountNumber;
@property(nonatomic, strong)NSString *mAiic;
@property(nonatomic, strong)Currency *mCurrency;
@property(nonatomic, strong)PlatformPermission *mPlatformPermissions;
@property(nonatomic, strong)ProfilePermission *mProfilePermissions;
@property(nonatomic, strong)NSArray *transactionPermissions;

- (id)initWithDictionary:(NSDictionary *)dict;

@end

