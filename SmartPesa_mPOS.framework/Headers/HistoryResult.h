//
//  HistoryResult.h
//  SmartPesaSDK
//
//  Created by Arun on 16/2/16.
//  Copyright © 2016 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistoryResult : NSObject


@property(nonatomic)int page;
@property(nonatomic)int total;
@property(nonatomic)int per_page;
@property(nonatomic, strong)NSArray *mTransactionResponses;

- (id)initWithDictionary:(NSDictionary *)dict;

@end
