//
//  TransactionResponse.h
//  SmartPesaSDK
//
//  Created by Arun on 16/2/16.
//  Copyright © 2016 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransactionResponse : NSObject

@property(nonatomic, strong)NSString *transactionId;
@property(nonatomic, strong)NSString *transactionReference;
@property(nonatomic, strong)NSDate *transactionDatetime;
@property(nonatomic, strong)NSString *trans_description;
@property(nonatomic, strong)NSString *amount;
@property(nonatomic, strong)NSString *currencyId;
@property(nonatomic, strong)NSString *responseCode;
@property(nonatomic, strong)NSString *notificationEmail;
@property(nonatomic, strong)NSString *notificationPhone;
@property(nonatomic, strong)NSString *merchantName;
@property(nonatomic, strong)NSString *merchantId;
@property(nonatomic, strong)NSString *serialNumber;
@property(nonatomic, strong)NSString *terminalId;
@property(nonatomic, strong)NSString *messageType;
@property(nonatomic, strong)NSString *method;
@property(nonatomic, strong)NSString *currencyName;
@property(nonatomic, strong)NSString *cardNumber;
@property(nonatomic, strong)NSString *cardExpiry;
@property(nonatomic, strong)NSString *cardHolderName;
@property(nonatomic, strong)NSString *cardName;
@property(nonatomic, strong)NSString *cardIcon;
@property(nonatomic, strong)NSString *acquiringBankId;
@property(nonatomic, strong)NSString *acquiringBankName;
@property(nonatomic, strong)NSString *operatorName;
@property(nonatomic, strong)NSString *operatorCode;
@property(nonatomic, strong)NSString *cardType;
@property(nonatomic, strong)NSString *operatorId;
@property(nonatomic, strong)NSString *merchantCode;
@property(nonatomic, strong)NSString *signatureId;
@property(nonatomic, strong)NSString *currencySymbol;
@property(nonatomic, strong)NSString *settledStatus;
@property(nonatomic, strong)NSString *transactionDescription;
@property(nonatomic, strong)NSString *transactionType;
@property(nonatomic, strong)NSString *cvmResult;
@property(nonatomic, strong)NSString *systemTraceAuditNumber;
@property(nonatomic, strong)NSString *cvmDescription;
@property(nonatomic, strong)NSString *responseDescription;
@property(nonatomic, strong)NSString *authorisationResponseCode;
@property(nonatomic, strong)NSString *authorisationResponse;

- (id)initWithDictionary:(NSDictionary *)dict;


@end
