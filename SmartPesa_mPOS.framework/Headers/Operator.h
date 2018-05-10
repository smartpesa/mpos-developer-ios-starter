//
//  Operator.h
//  SmartPesaSDK
//
//  Created by Arun on 16/3/15.
//  Copyright (c) 2015 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmartPesaBaseResponse.h"

@class ProfilePermission;

@interface Operator : SmartPesaBaseResponse

@property(nonatomic, strong)NSString *operator_id;
@property(nonatomic, strong)NSString *operator_name;
@property(nonatomic, strong)NSDate *date_entered;
@property(nonatomic, strong)NSString *operator_code;
@property(nonatomic)BOOL active;
@property(nonatomic, strong)NSString *merchant_id;
@property(nonatomic, strong)NSDate  *lastLoginDate;
@property(nonatomic, strong)NSString *notification_phone;
@property(nonatomic, strong)NSString *notification_email;

@property(nonatomic, strong)ProfilePermission *profilePermission;

- (id)initWithDictionary:(NSDictionary *)dict;

@end
