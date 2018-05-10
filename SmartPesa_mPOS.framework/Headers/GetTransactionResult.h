//
//  GetTransactionResult.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 11/16/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import "SmartPesaBaseResponse.h"

@class TransactionResponse;

@interface GetTransactionResult : SmartPesaBaseResponse

@property(nonatomic, strong)TransactionResponse *transaction;

@end
