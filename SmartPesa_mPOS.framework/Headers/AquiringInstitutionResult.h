//
//  AquiringInstitutionResult.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 11/16/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import "SmartPesaBaseResponse.h"

@class Institution;

@interface AquiringInstitutionResult : SmartPesaBaseResponse

@property(nonatomic, strong)Institution *institution;

@end
