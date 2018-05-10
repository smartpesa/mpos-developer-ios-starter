//
//  Card.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 11/11/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import "SmartPesaBaseResponse.h"

@interface Card : SmartPesaBaseResponse


@property(nonatomic, strong)NSString *card_id;
@property(nonatomic, strong)NSString *card_pan;
@property(nonatomic, strong)NSString *card_sequence;
@property(nonatomic, strong)NSString *card_hash;
@property(nonatomic, strong)NSDate *card_expiry;
@property(nonatomic, strong)NSString *card_holder_name;
@property(nonatomic, strong)NSString *card_aid;
@property(nonatomic, strong)NSString *notification_email;
@property(nonatomic, strong)NSString *notification_phone;
@property(nonatomic)int currency_iso4217;
@property(nonatomic, strong)NSString *bin;
@property(nonatomic, strong)NSString *card_type;
@property(nonatomic, strong)NSString *card_name;
@property(nonatomic, strong)NSString *card_icon;

- (id)initWithCardDictionary:(NSDictionary *)dict;

@end
