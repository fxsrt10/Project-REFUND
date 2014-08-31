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
        self.subtotal = nil;
        self.tax = nil;
        self.total = nil;
    }
    
    return self;
}

- (void)parseDataFromString:(NSString*)receiptString
{
    NSLog(@"%@", receiptString);
    self.test = @"This is a Test";
}


@end
