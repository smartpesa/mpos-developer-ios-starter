//
//  Institution.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 11/16/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import "SmartPesaBaseResponse.h"

@interface Institution : SmartPesaBaseResponse


@property(nonatomic, strong)NSString *acquiringInsId;
@property(nonatomic, strong)NSString *name;
@property(nonatomic, strong)NSString *instituition_description;
@property(nonatomic, strong)NSString *aiic;


@end
