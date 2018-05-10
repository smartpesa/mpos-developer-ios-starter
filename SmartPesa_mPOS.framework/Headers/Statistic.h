//
//  Statistic.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 11/16/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import "SmartPesaBaseResponse.h"

@interface Statistic : SmartPesaBaseResponse

@property(nonatomic, strong)NSString *transactionDescription;
@property(nonatomic, strong)NSString *transactionType;
@property(nonatomic)int count;
@property(nonatomic)double amount;

@end
