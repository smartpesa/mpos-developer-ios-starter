//
//  GetHistoryResponse.h
//  SmartPesaSDK
//
//  Created by Arun on 16/2/16.
//  Copyright © 2016 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmartPesaBaseResponse.h"
#import "HistoryResult.h"

@interface GetHistoryResponse : SmartPesaBaseResponse

@property(nonatomic, strong)HistoryResult *mHistoryResult;

@end
