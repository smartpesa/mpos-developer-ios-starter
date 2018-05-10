//
//  HostResponse.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 30/7/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmartPesaBaseResponse.h"
#import "Transaction.h"

@interface HostResponse : SmartPesaBaseResponse


@property(nonatomic, strong)NSArray *balances;

@property(nonatomic, strong)NSString *card_bin;
@property(nonatomic, strong)NSString *card_bin_id;
@property(nonatomic, strong)NSString *card_aid;
@property(nonatomic, strong)NSString *card_expiry;
@property(nonatomic, strong)NSString *card_hash;
@property(nonatomic, strong)NSString *card_holder_name;
@property(nonatomic, strong)NSString *card_icon;
@property(nonatomic, strong)NSString *card_id;
@property(nonatomic, strong)NSString *card_name;
@property(nonatomic, strong)NSString *card_pan;
@property(nonatomic, strong)NSString *card_sequence;
@property(nonatomic, strong)NSString *card_type;
@property(nonatomic, strong)NSString *card_currency_iso4217;
@property(nonatomic, strong)NSString *notification_email;
@property(nonatomic, strong)NSString *notification_phone;

@property(nonatomic, strong)NSDictionary *extra_data;
@property(nonatomic, strong)NSString *tlv;
@property(nonatomic, strong)Transaction *transaction;


- (id)initWithHostResponse:(NSDictionary *)dict;






@end
