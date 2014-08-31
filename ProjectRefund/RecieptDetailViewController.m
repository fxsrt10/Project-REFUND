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

@interface RecieptDetailViewController ()

@end

@implementation RecieptDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setTitle:@"Receipt"];
    
    if (self.isFromScanner) {
        NSLog(@"yes");
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        
        
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
}

- (void)cancelImage
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)saveImage
{
    if (self.isFromScanner) {
        [[RecieptItemStore sharedStore] createItemFromParser:self.parser];
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}




@end

