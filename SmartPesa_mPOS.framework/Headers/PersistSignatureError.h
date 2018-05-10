//
//  PersisSignatureError.h
//  SmartPesaSDK
//
//  Created by Arun on 16/2/16.
//  Copyright © 2016 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmartPesaBaseResponse.h"

typedef enum {
    SIGNATURE_UPLOAD_ERROR,
    SINGNATURE_REQUEST_INPUT
    
} PersistSignatureErrorReason;

@interface PersistSignatureError : SmartPesaBaseResponse

@property(nonatomic)PersistSignatureErrorReason mErrorReason;

- (id)initPersistSignatureError:(NSString *)detailMessge :(PersistSignatureErrorReason)errorReason;

@end
