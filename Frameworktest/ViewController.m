//
//  ViewController.m
//  Frameworktest
//
//  Created by Arun on 14/2/17.
//  Copyright © 2017 Arun. All rights reserved.
//

#import "ViewController.h"
#import <SmartPesa_mPOS/SmartPesaHeaders.h>
#import "LoginViewController.h"

@interface ViewController ()<SmartPesaDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SmartPesaSDK sharedInstance].delegate = self;
    [[SmartPesaSDK sharedInstance] getVersion];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)success:(SmartPesaBaseResponse *)resposneObject
{
    GetVersionResponse *resposne = (GetVersionResponse *)resposneObject;
    VersionInfo *info = resposne.mVersionInfo;
    NSString *buildDate = @"";
    
    LoginViewController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"Login"];
    [self.navigationController pushViewController:newView animated:YES];
}



- (void)onError:(SmartPesaBaseResponse *)error
{
    GetVersionError *resposne = (GetVersionError *)error;
    
}

- (void)onFailureWithCustomError:(NSError *)error
{
    
}

- (void)onSessionError
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
