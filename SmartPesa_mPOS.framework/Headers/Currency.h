//
//  Currency.h
//  SmartPesa
//
//  Created by Arun on 21/2/15.
//  Copyright (c) 2015 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Currency : NSObject

@property(nonatomic, strong)NSString *currency_id;
@property(nonatomic, strong)NSString *currency_name;
@property(nonatomic, strong)NSString *currency_symbol;
@property(nonatomic)int currency_iso4217;
@property(nonatomic)int currency_decimals;
@property(nonatomic)int conversion_rate;

- (id)initWithDictionary:(NSDictionary *)dict;


@end




