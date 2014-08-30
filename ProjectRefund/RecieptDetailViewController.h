//
//  RecieptDetailViewController.h
//  ProjectRefund
//
//  Created by UH Game and Entrepreneurship on 8/30/14.
//  Copyright (c) 2014 GeauxHack. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecieptItem;

@interface RecieptDetailViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITextField *serialTextField;
@property (nonatomic, weak) IBOutlet UITextField *valueTextField;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, weak) IBOutlet UIButton *deletePhotoButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *cameraButton;

@property (nonatomic, strong) RecieptItem *item;
@property (weak, nonatomic) IBOutlet UIButton *changeDateButton;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
