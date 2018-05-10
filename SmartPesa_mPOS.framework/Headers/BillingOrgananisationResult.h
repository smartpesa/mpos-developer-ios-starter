//
//  BillingOrgananisationResult.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 11/16/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import "SmartPesaBaseResponse.h"

@interface BillingOrgananisationResult : SmartPesaBaseResponse


@property(nonatomic, strong)NSString *billingOrgId;
@property(nonatomic, strong)NSString *name;
@property(nonatomic, strong)NSString *billingOrg_description;
@property(nonatomic, strong)NSString *category;


@end
