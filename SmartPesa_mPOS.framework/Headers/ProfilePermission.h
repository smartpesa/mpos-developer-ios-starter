//
//  ProfilePermission.h
//  SmartPesa
//
//  Created by Arun on 21/2/15.
//  Copyright (c) 2015 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProfilePermission : NSObject

@property(nonatomic)BOOL all_history;
@property(nonatomic)BOOL manage_operators;
@property(nonatomic)BOOL print_receipt;

- (id)initWithDictionary:(NSDictionary *)dict;

@end
