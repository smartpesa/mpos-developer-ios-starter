//
//  VersionInfo.h
//  SmartPesaNetworkEngine
//
//  Created by Arun on 6/11/15.
//  Copyright © 2015 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VersionInfo : NSObject


@property(nonatomic)int mMajor;
@property(nonatomic)int mMinor;
@property(nonatomic)int mBuild;
@property(nonatomic, strong)NSString *mMinimum;
@property(nonatomic)int iteration;
@property(nonatomic, strong)NSDate *mBuildDate;
@property(nonatomic, strong)NSString *mGooglePlayUrl;
@property(nonatomic, strong)NSString *mAppleAppstoreUrl;
@property(nonatomic, strong)NSDate *mSystemDateTime;
@property(nonatomic, strong)NSString *versionInServer;
@property(nonatomic, strong)NSString *currentSDKVersion;

- (id)initWithDictionary:(NSDictionary *)dict;

@end
