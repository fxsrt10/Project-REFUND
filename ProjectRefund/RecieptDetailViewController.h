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
@property (nonatomic, strong) NSMutableArray *itemsArray;
@property (nonatomic, copy) NSString *subtotal;
@property (nonatomic, copy) NSString *total;
@property (nonatomic, copy) NSString *tax;
@property (nonatomic, copy) NSString *paymentType;

@end
