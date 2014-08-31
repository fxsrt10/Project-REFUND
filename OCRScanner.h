//
//  OCRScanner.h
//  ProjectRefund
//
//  Created by Stephen Meriwether on 8/30/14.
//  Copyright (c) 2014 GeauxHack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRTextParser.h"

@interface OCRScanner : NSObject
+ (instancetype)sharedRecognizer;
- (void)recognizeTextWithImage:(UIImage*)image withParser:(PRTextParser*)parser;
@end
