//
//  Balance.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 2/8/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmartPesaBaseResponse.h"

@class Currency;

@interface Balance : SmartPesaBaseResponse

@property(nonatomic)int account_type;
@property(nonatomic)int amount_type;
@property(nonatomic)int currency_code;
@property(nonatomic)float amount;
@property(nonatomic, strong)Currency *currency;


- (id)initWithBalanceDictionary:(NSDictionary *)dict;

@end
