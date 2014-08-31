//
//  RecieptItem.h
//  ProjectRefund
//
//  Created by UH Game and Entrepreneurship on 8/30/14.
//  Copyright (c) 2014 GeauxHack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecieptItem : NSObject

@property (nonatomic, copy) NSArray *itemsArray;
@property (nonatomic, copy) NSString *subtotal;
@property (nonatomic, copy) NSString *total;
@property (nonatomic, copy) NSString *tax;

// designated initializer for BNRItem
- (instancetype)initWithItems:(NSMutableArray *)itemsArray
                     subtotal:(NSString *)subtotal
                        total:(NSString *)total
                          tax:(NSString *)tax;
- (instancetype)initTest;

- (NSString *)description;



@end
