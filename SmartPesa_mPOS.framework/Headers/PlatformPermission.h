//
//  PlatformPermission.h
//  SmartPesa
//
//  Created by Arun on 21/2/15.
//  Copyright (c) 2015 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PlatformPermission : NSObject

@property(nonatomic)BOOL supportAccountInstalments;
@property(nonatomic)BOOL supportSettlement;
@property(nonatomic)BOOL supportDcc;
@property(nonatomic)BOOL supportMmag;
@property(nonatomic)BOOL supportChip;
@property(nonatomic)BOOL magFallback;
@property(nonatomic)int defaultFromAccountType;
@property(nonatomic)int defaultToAccountType;

- (id)initWithDictionary:(NSDictionary *)dict;

@end

