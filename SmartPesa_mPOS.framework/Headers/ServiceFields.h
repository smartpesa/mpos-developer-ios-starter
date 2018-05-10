//
//  ServiceFields.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 11/16/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import "SmartPesaBaseResponse.h"

@class ServiceAllFields;

@interface ServiceFields : SmartPesaBaseResponse

@property(nonatomic, strong)ServiceAllFields *serviceFieldsList;

@end
