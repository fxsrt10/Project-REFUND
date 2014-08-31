//
//  PRTextParser.h
//  ProjectRefund
//
//  Created by Stephen Meriwether on 8/30/14.
//  Copyright (c) 2014 GeauxHack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRTextParser : NSObject

@property (nonatomic, strong) NSMutableArray *itemsArray;
@property (nonatomic, copy) NSString *subtotal;
@property (nonatomic, copy) NSString *total;
@property (nonatomic, copy) NSString *tax;
@property (nonatomic, copy) NSString *paymentType;

@property (nonatomic, copy) NSString *test;


- (void)parseDataFromString:(NSString*)receiptString;

@end
