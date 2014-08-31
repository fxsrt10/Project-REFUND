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
    NSLog(@"%@", receiptString);
    self.test = @"This is a Test";
    NSRange range;
    
    // Find paymentType
    NSArray *paymentTypeCashPossibilities = @[@"Cash", @"Casa", @"CHSH", @"C559", @"C591", @"Casn", @"Casi", @"casa", @"C880"];
    for (int i = 0; i < [paymentTypeCashPossibilities count]; i++) {
        NSString *string = paymentTypeCashPossibilities[i];
        if ([receiptString rangeOfString:string].location == NSNotFound) {
        }
        else {
            NSLog(@"Cash");
            self.subtotal = @"Cash";
            break;
        }
    }
    
    NSArray *paymentTypeCreditPossibilities = @[@"Credit", @"CREDIT"];
    for (int i = 0; i < [paymentTypeCreditPossibilities count]; i++) {
        NSString *string = paymentTypeCreditPossibilities[i];
        if ([receiptString rangeOfString:string].location == NSNotFound) {
        }
        else {
            NSLog(@"Credit");
            self.subtotal = @"Credit Card";
            break;
        }
    }
    
    NSString *substring = nil;
    if (!range.location == NSNotFound) {
        NSLog(@"Here");
        substring = [[receiptString substringFromIndex:NSMaxRange(range)] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    
    NSLog(@"%@", substring);
}


@end
