//
//  ResponseStatus.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 11/15/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseStatus : NSObject


@property(nonatomic)NSInteger resposneCode;
@property(nonatomic, strong)NSString *responseMessage;

- (id)initWithResposneCode:(NSInteger)code andMessage:(NSString *)message;




@end
