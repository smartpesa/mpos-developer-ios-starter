//
//  Device.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 11/16/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import "SmartPesaBaseResponse.h"

@interface Device : SmartPesaBaseResponse

@property(nonatomic, strong)NSString *deviceId;
@property(nonatomic, strong)NSString *serialNumber;
@property(nonatomic, strong)NSString *terminalType;
@property(nonatomic, strong)NSString *bootloaderVersion;
@property(nonatomic, strong)NSString *firmwareVersion;
@property(nonatomic, strong)NSString *hardwareVersion;
@property(nonatomic, strong)NSString *productId;
@property(nonatomic, strong)NSString *interfaceDeviceNumber;
@property(nonatomic, strong)NSDate *dateEntered;
@property(nonatomic, strong)NSDate *lastSeen;
@property(nonatomic, strong)NSDate *issueDate;
@property(nonatomic, strong)NSString *usedCounter;
@property(nonatomic, strong)NSString *merchantId;


@end
