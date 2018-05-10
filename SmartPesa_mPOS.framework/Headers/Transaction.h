//
//  Transaction.h
//  SmartPesa
//
//  Created by Arun on 22/2/15.
//  Copyright (c) 2015 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmartPesaBaseResponse.h"

@interface Transaction : SmartPesaBaseResponse
{

}

@property(nonatomic, strong)NSString *transaction_id;
@property(nonatomic, strong)NSString *transaction_reference;
@property(nonatomic, strong)NSDate *transactionDateAndTime;
@property(nonatomic, strong)NSString *description;
@property(nonatomic)float amount;
@property(nonatomic, strong)NSString *currency_id;
@property(nonatomic)int response_code;
@property(nonatomic, strong)NSString *notification_email;
@property(nonatomic, strong)NSString *notification_phone;
@property(nonatomic, strong)NSString *merchant_name;
@property(nonatomic, strong)NSString *merchant_id;
@property(nonatomic, strong)NSString *serial_number;
@property(nonatomic, strong)NSString *terminal_id;
@property(nonatomic, strong)NSString *message_type;
@property(nonatomic)int method;
@property(nonatomic, strong)NSString *currency_name;
@property(nonatomic, strong)NSString *card_number;
@property(nonatomic, strong)NSString *card_type;
@property(nonatomic, strong)NSString *card_expiry;
@property(nonatomic, strong)NSString *card_holder_name;
@property(nonatomic, strong)NSString *card_name;
@property(nonatomic, strong)NSString *card_icon;
@property(nonatomic, strong)NSString *acquiring_bank_id;
@property(nonatomic, strong)NSString *acquiring_bank_name;
@property(nonatomic, strong)NSString *operator_name;
@property(nonatomic, strong)NSString *operator_code;
@property(nonatomic, strong)NSString *operator_id;
@property(nonatomic, strong)NSString *merchant_code;
@property(nonatomic, strong)NSString *signature_id;
@property(nonatomic, strong)NSString *currency_symbol;
@property(nonatomic, strong)NSString *cvm_result;
@property(nonatomic, strong)NSString *resposneDescription;
@property(nonatomic, strong)NSString *cvm_description;
@property(nonatomic, strong)NSString *system_trace_audit_number;
@property(nonatomic, strong)NSString *transaction_type;
@property(nonatomic, strong)NSString *transaction_description;
@property(nonatomic, strong)NSString *settled_Status;
@property(nonatomic, strong)NSString *device_id;
@property(nonatomic, strong)NSString *authorisation_response_code;
@property(nonatomic, strong)NSString *authorisation_response;

@end







