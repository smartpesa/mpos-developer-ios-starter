//
//  ServiceField.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 11/16/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import "SmartPesaBaseResponse.h"

@interface ServiceField : SmartPesaBaseResponse

@property(nonatomic, strong)NSString *name;
@property(nonatomic, strong)NSString *label;
@property(nonatomic, strong)NSString *type;
@property(nonatomic, strong)NSString *format;
@property(nonatomic, strong)NSArray *values;

@end
