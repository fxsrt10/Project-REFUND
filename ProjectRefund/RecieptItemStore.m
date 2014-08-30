//
//  RecieptItemStore.m
//  ProjectRefund
//
//  Created by UH Game and Entrepreneurship on 8/30/14.
//  Copyright (c) 2014 GeauxHack. All rights reserved.
//

#import "RecieptItemStore.h"
#import "RecieptItem.h"
#import "RecieptImageStore.h"

@interface RecieptItemStore()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation RecieptItemStore

+ (instancetype)sharedStore
{
    static RecieptItemStore *sharedStore;
    
    // Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init
{
    [NSException raise:@"Singleton" format:@"Use +[BNRItemStore sharedStore]"];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    
    if(self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allItems
{
    return [self.privateItems copy];
}

- (RecieptItem *)createItem
{
    RecieptItem *item = [RecieptItem randomItem];
    [self.privateItems addObject:item];
    
    return item;
}
//FIX IMAGE STORE
- (void)removeItem:(RecieptItem *)item
{
    NSString *key = item.recieptItemKey;
    
    [[RecieptImageStore sharedStore] deleteImageForKey:key];
    
    [self.privateItems removeObjectIdenticalTo:item];
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (fromIndex == toIndex) {
        return;
    }
    
    RecieptItem *fromItem = self.privateItems[fromIndex];
    [self.privateItems removeObjectAtIndex:fromIndex];
    [self.privateItems insertObject:fromItem
                            atIndex:toIndex];
    
}


@end
