//
//  PaymentViewController.h
//  SmartPesa
//
//  Created by Arun on 21/2/15.
//  Copyright (c) 2015 SmartPesa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SmartPesa_mPOS/SmartPesaHeaders.h>

@interface PaymentViewController : UIViewController

@property(nonatomic)TransactionType  transactionType;
@property(nonatomic, readwrite)VerifyMerchantInfo *merchant;

@end
