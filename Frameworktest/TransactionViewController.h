//
//  TransactionViewController.h
//  SmartPesa
//
//  Created by Arun on 4/4/15.
//  Copyright (c) 2015 SmartPesa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SmartPesa_mPOS/SmartPesaHeaders.h>

@interface TransactionViewController : UIViewController



@property(nonatomic, strong)NSString *amount;
@property(nonatomic, strong)NSString *reference;
@property(nonatomic)TransactionType transactionType;
@property(nonatomic, readwrite)VerifyMerchantInfo *merchant;

@end
