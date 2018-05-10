//
//  TransactionPermissions.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 7/11/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmartPesaBaseResponse.h"

@interface TransactionPermissions : SmartPesaBaseResponse

@property(nonatomic) int transactionTypeEnumId;
@property(nonatomic, strong) NSString *transactionDescription;

- (id)initWithDictionary:(NSDictionary *)dict;

@end
