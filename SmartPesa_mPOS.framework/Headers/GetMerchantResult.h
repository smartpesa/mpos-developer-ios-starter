//
//  GetMerchantResult.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 11/16/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import "SmartPesaBaseResponse.h"

@class MerchantInfo;

@interface GetMerchantResult : SmartPesaBaseResponse

@property(nonatomic, strong)MerchantInfo *merchant;

@end
