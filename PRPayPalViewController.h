//
//  PRPayPalViewController.h
//  ProjectRefund
//
//  Created by Stephen Meriwether on 8/31/14.
//  Copyright (c) 2014 GeauxHack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PRPayPalViewController : UIViewController
@property (nonatomic, strong) NSMutableArray *itemsArray;
@property (nonatomic, copy) NSString *subtotal;
@property (nonatomic, copy) NSString *total;
@property (nonatomic, copy) NSString *tax;
@property (nonatomic, copy) NSString *paymentType;
@end
