//
//  RecieptDetailViewController.h
//  ProjectRefund
//
//  Created by UH Game and Entrepreneurship on 8/30/14.
//  Copyright (c) 2014 GeauxHack. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PRTextParser;
@class RecieptItem;

@interface RecieptDetailViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic) BOOL isFromScanner;
@property (nonatomic) PRTextParser *parser;

@end
