//
//  ServiceInfo.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 11/16/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import "SmartPesaBaseResponse.h"

@class ServiceFields;

@interface ServiceInfo : SmartPesaBaseResponse

@property(nonatomic, strong)NSString *serviceId;
@property(nonatomic, strong)NSString *serviceName;
@property(nonatomic, strong)NSString *type;
@property(nonatomic, strong)NSString *service_description;
@property(nonatomic, strong)NSString *sort;
@property(nonatomic, strong)NSString *icon;
@property(nonatomic, strong)ServiceFields *definition;

@end
