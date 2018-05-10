//
//  GetHistoryError.h
//  SmartPesaSDK
//
//  Created by Arun on 16/2/16.
//  Copyright © 2016 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmartPesaBaseResponse.h"


typedef enum {
    HISTORY_ERROR,
    HISTORY_REQUEST_INPUT
    
} GetHistoryErrorReason;

@interface GetHistoryError : SmartPesaBaseResponse

@property(nonatomic)GetHistoryErrorReason mErrorReason;

- (id)initGetHistoryError:(NSString *)detailMessge :(GetHistoryErrorReason)errorReason;

@end

