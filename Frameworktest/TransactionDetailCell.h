//
//  TransactionDetailCell.h
//  SmartPesa
//
//  Created by Arun on 22/2/15.
//  Copyright (c) 2015 SmartPesa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Transaction;

@interface TransactionDetailCell : UITableViewCell

- (void)setTransactionDetailsWith:(Transaction *)transaction;
- (void)setContactDetails:(Transaction *)transaction;


@property(nonatomic, weak)IBOutlet UIButton *button1;
@property(nonatomic, weak)IBOutlet UIButton *button2;
@property(nonatomic, weak)IBOutlet UIButton *button3;
@property(nonatomic, weak)IBOutlet UIButton *button4;
@property(nonatomic, weak)IBOutlet UIButton *button5;
@property(nonatomic, weak)IBOutlet UIButton *button6;
@property(nonatomic, weak)IBOutlet UIButton *button7;
@property(nonatomic, weak)IBOutlet UIButton *button8;
@property(nonatomic, weak)IBOutlet UIButton *button9;
@property(nonatomic, weak)IBOutlet UIButton *button0;
@property(nonatomic, weak)IBOutlet UIButton *buttonBackSpace;
@property(nonatomic, weak)IBOutlet UIButton *buttonClear;
@property(nonatomic, weak)IBOutlet UIButton *continueButton;


@end
