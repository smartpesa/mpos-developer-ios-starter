//
//  AccountType.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 11/16/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import "SmartPesaBaseResponse.h"

@interface AccountType_ : SmartPesaBaseResponse



@property(nonatomic, strong)NSString *accountType;
@property(nonatomic, strong)NSString *account_description;
@property(nonatomic)BOOL active;


@end
