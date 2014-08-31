//
//  PRTextParser.m
//  ProjectRefund
//
//  Created by Stephen Meriwether on 8/30/14.
//  Copyright (c) 2014 GeauxHack. All rights reserved.
//

#import "PRTextParser.h"

@implementation PRTextParser

- (id)init
{
    self = [super init];
    
    if (self) {
        self.itemsArray = [[NSMutableArray alloc] init];
        self.subtotal = @"LOL";
        self.tax = nil;
        self.total = nil;
        self.paymentType = nil;
    }
    
    return self;
}

- (void)parseDataFromString:(NSString*)receiptString
{
    self.test = @"This is a Test";
    NSLog(@"%@", receiptString);
    
    NSString *sep = @" \n";
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:sep];
    NSArray *temp = [receiptString componentsSeparatedByCharactersInSet:set];

    // Get the subtotal
    NSArray *subTotalPossibilities = @[@"Sale", @"Amount", @"Balance", @"Total", @"Payment", @"Subtotai", @"Subtotat", @"Subtotal", @"BHLRNCE"];
    for (int i = 0; i < [temp count]; i++) {
        for (int j = 0; j < [subTotalPossibilities count]; j++) {
            NSString *temp1 = [temp objectAtIndex:i];
            NSString *temp2 = [subTotalPossibilities objectAtIndex:j];
            if ([temp1 isEqualToString:temp2]) {
                self.subtotal = temp[i + 1];
                i = [temp count];
                break;
            }
        }
        
    }
    
    
    // Get the salestax
    NSArray *taxPossibilities = @[@"Tax"];
    for (int i = 0; i < [temp count]; i++) {
        for (int j = 0; j < [taxPossibilities count]; j++) {
            NSString *temp1 = [temp objectAtIndex:i];
            NSString *temp2 = [taxPossibilities objectAtIndex:j];
            if ([temp1 isEqualToString:temp2]) {
                self.tax = temp[i + 1];
                i = [temp count];
                break;
            }
        }
        
    }

    
     // Get the PayType (Cash)
     NSArray *paymentTypeCashPossibilities = @[@"Cash", @"Casa", @"CHSH", @"C559", @"C591", @"Casn", @"Casi", @"casa", @"C880", @"Casw", @"C681", @"Cast"];
     for (int i = 0; i < [temp count]; i++) {
         for (int j = 0; j < [paymentTypeCashPossibilities count]; j++) {
             NSString *temp1 = [temp objectAtIndex:i];
             NSString *temp2 = [paymentTypeCashPossibilities objectAtIndex:j];
             if ([temp1 isEqualToString:temp2]) {
                 self.paymentType = @"Cash";
                 NSLog(@"Got Cash!!!");
                 i = [temp count];
                 break;
             }
          }
                  
      }
    
    // Get the PayType (Cash)
    NSArray *paymentTypeCreditPossibilities = @[@"Credit", @"CREDIT"];
    for (int i = 0; i < [temp count]; i++) {
        for (int j = 0; j < [paymentTypeCreditPossibilities count]; j++) {
            NSString *temp1 = [temp objectAtIndex:i];
            NSString *temp2 = [paymentTypeCreditPossibilities objectAtIndex:j];
            if ([temp1 isEqualToString:temp2]) {
                self.paymentType = @"Credit";
                i = [temp count];
                break;
            }
        }
        
    }
}


@end
