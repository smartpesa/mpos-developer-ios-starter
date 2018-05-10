//
//  MerchantInfo.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 11/16/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import "SmartPesaBaseResponse.h"

@interface MerchantInfo : SmartPesaBaseResponse

@property(nonatomic, strong)NSString *merchantId;
@property(nonatomic, strong)NSString *merchantName;
@property(nonatomic, strong)NSString *merchantCode;
@property(nonatomic, strong)NSDate   *dateEntered;
@property(nonatomic, strong)NSDate   *dateModified;
@property(nonatomic, strong)NSString *account_type;
@property(nonatomic, strong)NSString *industry;
@property(nonatomic, strong)NSString *phoneFax;
@property(nonatomic, strong)NSString *billingAddressStreet;
@property(nonatomic, strong)NSString *billingAddressCity;
@property(nonatomic, strong)NSString *billingAddressState;
@property(nonatomic, strong)NSString *billingAddressPostalcode;
@property(nonatomic, strong)NSString *billingAddressCountry;
@property(nonatomic, strong)NSString *phoneOffice;
@property(nonatomic, strong)NSString *phoneAlternate;
@property(nonatomic, strong)NSString *website;
@property(nonatomic, strong)NSString *shippingAddressStreet;
@property(nonatomic, strong)NSString *shippingAddressCity;
@property(nonatomic, strong)NSString *shippingAddressState;
@property(nonatomic, strong)NSString *shippingAddressPostalcode;
@property(nonatomic, strong)NSString *shippingAddressCountry;
@property(nonatomic, strong)NSString *emailAddress;
@property(nonatomic, strong)NSString *acquiringBankId;
@property(nonatomic, strong)NSDate   *lastSettlement;

@end
