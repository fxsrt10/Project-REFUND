//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Stephen Meriwether on 5/28/14.
//  Copyright (c) 2014 Stephen Meriwether. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RecieptItem;
@class PRTextParser;

@interface RecieptItemStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allItems;

+ (instancetype)sharedStore;
- (void)createItemFromParser:(PRTextParser*)parser;
- (void)removeItem:(RecieptItem *)item;
- (void)moveItemAtIndex:(NSUInteger)fromIndex
                toIndex:(NSUInteger)toIndex;

@end