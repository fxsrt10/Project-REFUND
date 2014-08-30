//
//  PRPreviewView.h
//  ProjectRefund
//
//  Created by Stephen Meriwether on 8/30/14.
//  Copyright (c) 2014 GeauxHack. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVCaptureSession;

@interface PRCamPreviewView : UIView

@property (nonatomic) AVCaptureSession *session;

@end
