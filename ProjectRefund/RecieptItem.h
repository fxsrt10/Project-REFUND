//
//  RecieptItem.h
//  ProjectRefund
//
//  Created by UH Game and Entrepreneurship on 8/30/14.
//  Copyright (c) 2014 GeauxHack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecieptItem : NSObject

@property (nonatomic, copy) NSString *recieptNumber;
@property (nonatomic, copy) NSString *recieptName;
@property (nonatomic) int valueInDollars;
@property (nonatomic) NSDate *dateCreated;
@property (nonatomic, copy) NSString *recieptItemKey;

+ (instancetype)randomItem;
// designated initializer for BNRItem
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    recieptNumber:(NSString *)sNumber;
- (instancetype)initWithItemName:(NSString *)name;
- (NSString *)description;



@end
