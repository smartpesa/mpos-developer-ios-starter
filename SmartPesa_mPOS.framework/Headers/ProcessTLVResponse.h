//
//  ProcessTLVResponse.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 11/11/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import "SmartPesaBaseResponse.h"
#import "Transaction.h"
#import "Card.h"

@interface ProcessTLVResponse : SmartPesaBaseResponse

{

}

@property(nonatomic, strong)Transaction *transaction;
@property(nonatomic, strong)Card *card;
@property(nonatomic, strong)NSDictionary *extraData;
@property(nonatomic, strong)NSString *tlv;

- (id)initWithDictionary:(NSDictionary *)dict;

@end
