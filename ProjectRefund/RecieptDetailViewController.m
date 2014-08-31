//
//  RecieptDetailViewController.m
//  ProjectRefund
//
//  Created by UH Game and Entrepreneurship on 8/30/14.
//  Copyright (c) 2014 GeauxHack. All rights reserved.
//

#import "RecieptDetailViewController.h"
#import "RecieptItem.h"
#import "RecieptItemStore.h"
#import "PRTextParser.h"

@interface RecieptDetailViewController ()
@property (weak, nonatomic) IBOutlet UIButton *paymentTypeLabel;
@property (weak, nonatomic) IBOutlet UITextField *subtotalTextField;
@property (weak, nonatomic) IBOutlet UITextField *taxTextField;
@property (weak, nonatomic) IBOutlet UITextField *totalTextField;
@end

@implementation RecieptDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setTitle:@"Receipt"];
    
    if (self.isFromScanner) {
        NSLog(@"yes");
        //[self.navigationController setNavigationBarHidden:NO animated:YES];
        
        
        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                               target:self
                                                                               action:@selector(cancelImage)];
        
        UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                      target:self
                                                                                      action:@selector(saveImage)];
        
        [self.navigationItem setLeftBarButtonItem:cancelButton];
        [self.navigationItem setRightBarButtonItem:saveButton];
    }
    else {
        
    }
    
    //self.parser = [[PRTextParser alloc] init];
    //self.parser = self.holdParser;
    
    [self updateFromParser];
}

- (void)updateFromParser
{
    self.subtotalTextField.text = self.subtotal;
    self.taxTextField.text = self.tax;
    self.totalTextField.text = self.total;
    self.paymentTypeLabel.titleLabel.text = self.paymentType;
}

- (void)cancelImage
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)saveImage
{
    if (self.isFromScanner) {
        //[[RecieptItemStore sharedStore] createItemFromParser:self.parser];
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}




@end

