//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Stephen Meriwether on 6/3/14.
//  Copyright (c) 2014 Stephen Meriwether. All rights reserved.
//

#import "RecieptImageStore.h"

@interface RecieptImageStore()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation RecieptImageStore

+ (instancetype)sharedStore
{
    static RecieptImageStore *sharedStore;
    
    if(!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (instancetype)init
{
    [NSException raise:@"Singleton" format:@"Use +[BNRImageStore sharedStore]"];
    return nil;
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
    self.dictionary[key] = image;
}

- (UIImage *)imageForKey:(NSString *)key
{
    return self.dictionary[key];
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    
    [self.dictionary removeObjectForKey:key];
}

@end
