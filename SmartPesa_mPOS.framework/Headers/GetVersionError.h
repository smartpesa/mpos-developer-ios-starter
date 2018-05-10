//
//  GetVersionError.h
//  SmartPesaSDK
//
//  Created by Arun on 15/2/16.
//  Copyright © 2016 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmartPesaBaseResponse.h"

@class VersionInfo;

typedef enum {
    UPGRADE_OPTIONAL,
    UPGRADE_MANDATORY,
    VERSION_CHECK_ERROR
} VersionErrorReason;

@interface GetVersionError : SmartPesaBaseResponse

@property(nonatomic)VersionErrorReason mErrorReason;
@property(nonatomic, strong)VersionInfo *mVersionInfo;

- (id)initGetVersionError:(VersionInfo *)versionInfo :(NSString *)detailMessge :(VersionErrorReason)errorReason;

@end
