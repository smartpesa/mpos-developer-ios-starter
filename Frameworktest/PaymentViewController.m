//
//  PaymentViewController.m
//  SmartPesa
//
//  Created by Arun on 21/2/15.
//  Copyright (c) 2015 SmartPesa. All rights reserved.
//

#import "PaymentViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "TransactionViewController.h"
#import "TransactionDetailCell.h"

#define MAX_PAYMENT_ACCEPTED 12
#define APP_THEME_COLOR  [UIColor colorWithRed:233.0/255.0 green:175.0/255.0 blue:10.0/255.0 alpha:1]

@interface PaymentViewController ()<UITextFieldDelegate>



@property(nonatomic, weak)IBOutlet UITextField *amountTextField;
@property(nonatomic, weak)IBOutlet UITextField *referenceTextField;
@property(nonatomic, weak)IBOutlet UILabel *cnameDisplay;

@property(nonatomic, strong)NSMutableArray *numberArray;

- (IBAction)pairAction:(id)sender;


@end

@implementation PaymentViewController

@synthesize merchant;
@synthesize transactionType;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNumber];
    [self initializeDisplayAmount];
    
    
    NSString *currencyName = self.merchant.mCurrency.currency_symbol;
    self.cnameDisplay.text = currencyName;
    
    [[_amountTextField layer] setBorderColor:[UIColor blackColor].CGColor];
    [[_amountTextField layer] setBorderWidth:1.0];
    _amountTextField.layer.cornerRadius = 7;
    
    [[_referenceTextField layer] setBorderColor:[UIColor blackColor].CGColor];
    [[_referenceTextField layer] setBorderWidth:1.0];
    _referenceTextField.layer.cornerRadius = 7;
}



+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 2.0f, 2.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}



#pragma mark - Currency Display formatters

- (void)displayAmount:(NSMutableArray *)mutableCopyArray
{
    if ([self hasDecimal])
    {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        NSString *decimalSymbol = [formatter decimalSeparator];
        
        NSLog(@"%@", decimalSymbol);
        
        [mutableCopyArray insertObject:decimalSymbol atIndex:([mutableCopyArray count] - [self decimalCount])];
    }
    
    NSString * combinedStuff = [mutableCopyArray componentsJoinedByString:@""];
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [f numberFromString:combinedStuff];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setMaximumFractionDigits:[self decimalCount]];
    [numberFormatter setMinimumFractionDigits:[self decimalCount]];
    [numberFormatter setMinimumIntegerDigits:1];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:myNumber];
    
    _amountTextField.text = formattedNumberString;
}

- (BOOL)hasDecimal
{
    return ([self decimalCount] > 0)?YES:NO;
}

- (void)initNumber
{
    self.numberArray = [[NSMutableArray alloc] initWithObjects:@"0", nil];
    
    for (int i = 0; i < [self decimalCount]; i ++)
    {
        [self.numberArray addObject:@"0"];
        [self.numberArray addObject:@"0"];
    }
}

- (int)decimalCount
{
    int digits = [self.merchant.mCurrency currency_decimals];
    return digits;
}

- (void)initializeDisplayAmount
{
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithArray:self.numberArray];
    [self displayAmount:tempArray];
}

#pragma mark - Action methods
- (void)calculatorButtonTapped:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    switch (button.tag)
    {
        case 10:
        {
            [self.numberArray removeLastObject];
            if ([self.numberArray count] < ([self decimalCount] + 1))
            {
                [self.numberArray insertObject:@"0" atIndex:[self decimalCount]];
            }
        }
            break;
        case 11:
        {
            [self.numberArray removeAllObjects];
            [self initNumber];
        }
            break;
            
        default:
            [self.numberArray addObject:[NSString stringWithFormat:@"%d", button.tag]];
            break;
    }
    
    NSMutableArray *mutableCopyArray = [self.numberArray mutableCopy];
    
    [self displayAmount:mutableCopyArray];
}

- (IBAction)pairAction:(id)sender
{
    TransactionViewController *tc = [self.storyboard instantiateViewControllerWithIdentifier:@"Transaction"];

    tc.merchant = self.merchant;
    tc.amount = self.amountTextField.text;
    tc.reference = self.referenceTextField.text;
    tc.transactionType = self.transactionType;
    [self.navigationController pushViewController:tc animated:YES];
   // UI_Alert(@"", @"No paired bluetooth devices");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Textfield delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowCount = 1;
    
    
    return rowCount;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowHeight = 411;
    

    
    return rowHeight;
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"Cell";
    
    TransactionDetailCell *cell = (TransactionDetailCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TransactionDetailCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
        cell.button1.layer.cornerRadius = (cell.button1.bounds.size.height/2);
        cell.button2.layer.cornerRadius = (cell.button1.bounds.size.height/2);
        cell.button3.layer.cornerRadius = (cell.button1.bounds.size.height/2);
        cell.button4.layer.cornerRadius = (cell.button1.bounds.size.height/2);
        cell.button5.layer.cornerRadius = (cell.button1.bounds.size.height/2);
        cell.button6.layer.cornerRadius = (cell.button1.bounds.size.height/2);
        cell.button7.layer.cornerRadius = (cell.button1.bounds.size.height/2);
        cell.button8.layer.cornerRadius = (cell.button1.bounds.size.height/2);
        cell.button9.layer.cornerRadius = (cell.button1.bounds.size.height/2);
        cell.button0.layer.cornerRadius = (cell.button1.bounds.size.height/2);
        cell.buttonBackSpace.layer.cornerRadius = (cell.button1.bounds.size.height/2);
        cell.buttonClear.layer.cornerRadius = (cell.button1.bounds.size.height/2);
        
        cell.button1.tag = 1;
        cell.button2.tag = 2;
        cell.button3.tag = 3;
        cell.button4.tag = 4;
        cell.button5.tag = 5;
        cell.button6.tag = 6;
        cell.button7.tag = 7;
        cell.button8.tag = 8;
        cell.button9.tag = 9;
        cell.button0.tag = 0;
        cell.buttonBackSpace.tag = 10;
        cell.buttonClear.tag = 11;
        
        [cell.button0 addTarget:self action:@selector(calculatorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button1 addTarget:self action:@selector(calculatorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button2 addTarget:self action:@selector(calculatorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button3 addTarget:self action:@selector(calculatorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button4 addTarget:self action:@selector(calculatorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button5 addTarget:self action:@selector(calculatorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button6 addTarget:self action:@selector(calculatorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button7 addTarget:self action:@selector(calculatorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button8 addTarget:self action:@selector(calculatorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button9 addTarget:self action:@selector(calculatorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [cell.buttonClear addTarget:self action:@selector(calculatorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [cell.buttonBackSpace addTarget:self action:@selector(calculatorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.button0 setBackgroundImage:[PaymentViewController imageWithColor:APP_THEME_COLOR] forState:UIControlStateHighlighted];
        [cell.button1 setBackgroundImage:[PaymentViewController imageWithColor:APP_THEME_COLOR] forState:UIControlStateHighlighted];
        [cell.button2 setBackgroundImage:[PaymentViewController imageWithColor:APP_THEME_COLOR] forState:UIControlStateHighlighted];
        [cell.button3 setBackgroundImage:[PaymentViewController imageWithColor:APP_THEME_COLOR] forState:UIControlStateHighlighted];
        [cell.button4 setBackgroundImage:[PaymentViewController imageWithColor:APP_THEME_COLOR] forState:UIControlStateHighlighted];
        [cell.button5 setBackgroundImage:[PaymentViewController imageWithColor:APP_THEME_COLOR] forState:UIControlStateHighlighted];
        [cell.button6 setBackgroundImage:[PaymentViewController imageWithColor:APP_THEME_COLOR] forState:UIControlStateHighlighted];
        [cell.button7 setBackgroundImage:[PaymentViewController imageWithColor:APP_THEME_COLOR] forState:UIControlStateHighlighted];
        [cell.button8 setBackgroundImage:[PaymentViewController imageWithColor:APP_THEME_COLOR] forState:UIControlStateHighlighted];
        [cell.button9 setBackgroundImage:[PaymentViewController imageWithColor:APP_THEME_COLOR] forState:UIControlStateHighlighted];
        [cell.buttonClear setBackgroundImage:[PaymentViewController imageWithColor:APP_THEME_COLOR] forState:UIControlStateHighlighted];
        [cell.buttonBackSpace setBackgroundImage:[PaymentViewController imageWithColor:APP_THEME_COLOR] forState:UIControlStateHighlighted];
        
        [cell.button0 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [cell.button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [cell.button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [cell.button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [cell.button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [cell.button5 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [cell.button6 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [cell.button7 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [cell.button8 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [cell.button9 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [cell.button0 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [cell.buttonClear setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [cell.buttonBackSpace setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        
        cell.button1.clipsToBounds = YES;
        cell.button2.clipsToBounds = YES;
        cell.button3.clipsToBounds = YES;
        cell.button4.clipsToBounds = YES;
        cell.button5.clipsToBounds = YES;
        cell.button6.clipsToBounds = YES;
        cell.button7.clipsToBounds = YES;
        cell.button8.clipsToBounds = YES;
        cell.button9.clipsToBounds = YES;
        cell.button0.clipsToBounds = YES;
        cell.buttonBackSpace.clipsToBounds = YES;
        cell.buttonClear.clipsToBounds = YES;
        
        [cell.button1.layer setBorderColor:[APP_THEME_COLOR CGColor]];
        [cell.button2.layer setBorderColor:[APP_THEME_COLOR CGColor]];
        [cell.button3.layer setBorderColor:[APP_THEME_COLOR CGColor]];
        
        [[cell.button1 layer] setBorderWidth:2.0f];
        [[cell.button2 layer] setBorderWidth:2.0f];
        [[cell.button3 layer] setBorderWidth:2.0f];
        
        [cell.button4.layer setBorderColor:[APP_THEME_COLOR CGColor]];
        [cell.button5.layer setBorderColor:[APP_THEME_COLOR CGColor]];
        [cell.button6.layer setBorderColor:[APP_THEME_COLOR CGColor]];
        [[cell.button4 layer] setBorderWidth:2.0f];
        [[cell.button5 layer] setBorderWidth:2.0f];
        [[cell.button6 layer] setBorderWidth:2.0f];
        
        [cell.button7.layer setBorderColor:[APP_THEME_COLOR CGColor]];
        [cell.button8.layer setBorderColor:[APP_THEME_COLOR CGColor]];
        [cell.button9.layer setBorderColor:[APP_THEME_COLOR CGColor]];
        [[cell.button7 layer] setBorderWidth:2.0f];
        [[cell.button8 layer] setBorderWidth:2.0f];
        [[cell.button9 layer] setBorderWidth:2.0f];
        
        [cell.button0.layer setBorderColor:[APP_THEME_COLOR CGColor]];
        [cell.buttonBackSpace.layer setBorderColor:[APP_THEME_COLOR CGColor]];
        [cell.buttonClear.layer setBorderColor:[APP_THEME_COLOR CGColor]];
        [[cell.button0 layer] setBorderWidth:2.0f];
        [[cell.buttonBackSpace layer] setBorderWidth:2.0f];
        [[cell.buttonClear layer] setBorderWidth:2.0f];
        
        [cell.continueButton addTarget:self action:@selector(pairAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return cell;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
