//
//  RecieptDetailViewController.m
//  ProjectRefund
//
//  Created by UH Game and Entrepreneurship on 8/30/14.
//  Copyright (c) 2014 GeauxHack. All rights reserved.
//

#import "RecieptDetailViewController.h"
#import "RecieptItem.h"
#import "RecieptImageStore.h"

@interface RecieptDetailViewController ()

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

- (UIView *)createOverlay:(float)frameWidth heightOfFrame:(float)frameHeight;

@end

@implementation RecieptDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    RecieptItem *item = self.item;
    
    self.nameTextField.text = item.recieptName;
    self.serialTextField.text = item.recieptNumber;
    self.valueTextField.text = [NSString stringWithFormat:@"%d", item.valueInDollars];
    
    // you need an NSDateFormatter that will turn a date into a simple date string
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    // use filtered NSDate object to set dateLabel contents
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
    
    // get the image for its image key from the image store and put it on the screen
    self.imageView.image = [[RecieptImageStore sharedStore] imageForKey:item.recieptItemKey];
    
    if (self.imageView.image) {
        [self.cameraButton setEnabled:NO];
        [self.deletePhotoButton setEnabled:YES];
    }
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    
    //BNRItem *item = self.item;
    self.item.recieptName = self.nameTextField.text;
    self.item.recieptNumber = self.serialTextField.text;
    self.item.valueInDollars = [self.valueTextField.text intValue];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)setItem:(RecieptItem *)item
{
    _item = item;
    self.navigationItem.title = _item.recieptName;
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    // use filtered NSDate object to set dateLabel contents
    self.dateLabel.text = [dateFormatter stringFromDate:self.item.dateCreated];
}

- (IBAction)takePicture:(id)sender
{
    UIImagePickerController *openCamera = [[UIImagePickerController alloc] init];
    [openCamera setAllowsEditing:YES];
    
    // if the device has a camera, take a picture, otherwise just pick a photo
    // from the photo library
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        openCamera.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        openCamera.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    openCamera.delegate = self;
    
    // create an overlay for the edit view
    //[openCamera setCameraOverlayView:[self createOverlay:openCamera.view.frame.size.width
    //                                       heightOfFrame:openCamera.view.frame.size.height]];
    
    [self presentViewController:openCamera animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // get picked image from image dictionary
    UIImage *image = info[UIImagePickerControllerEditedImage];
    
    // store the image in teh BNRImageStore for this key
    [[RecieptImageStore sharedStore] setImage:image
                                   forKey:self.item.recieptItemKey];
    
    // put that image on the screen
    //self.imageView.image = image;
    
    // take image picker off the screen - you must call this when overriding this function
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)backgroundTapped:(id)sender
{
    [self.view endEditing:YES];
}

- (IBAction)deletePhoto:(id)sender
{
    [[RecieptImageStore sharedStore] deleteImageForKey:self.item.recieptItemKey];
    self.imageView.image = nil;
    
    [self.cameraButton setEnabled:YES];
}


@end

