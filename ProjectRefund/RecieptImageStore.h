//
//  BNRImageStore.h
//  Homepwner
//
//  Created by Stephen Meriwether on 6/3/14.
//  Copyright (c) 2014 Stephen Meriwether. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecieptImageStore : NSObject

+ (instancetype)sharedStore;

- (void)setImage:(UIImage *) image forKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;

@end
