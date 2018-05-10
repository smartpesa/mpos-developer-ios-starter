//
//  GetDeviceResult.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 11/16/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import "SmartPesaBaseResponse.h"

@interface GetDeviceResult : SmartPesaBaseResponse

@property(nonatomic, strong)NSArray *devices;

@end
