//
//  SimpleVisualiViewController.h
//  airUI
//
//  Created by Sandeep on 8/23/14.
//  Copyright (c) 2014 Carpe Diem. All rights reserved.
//


#import <Foundation/Foundation.h>

////////////////////////////////////////////////////////////////////
// File includes:
#import "EAGLView.h"
#import "CameraCalibration.hpp"
#import "BGRAVideoFrame.h"

@interface SimpleVisualizationController : NSObject
{
    EAGLView * m_glview;
    GLuint m_backgroundTextureId;
    std::vector<Transformation> m_transformations;
    CameraCalibration m_calibration;
    CGSize m_frameSize;
}

-(id) initWithGLView:(EAGLView*)view calibration:(CameraCalibration) calibration frameSize:(CGSize) size;

-(void) drawFrame;
-(void) updateBackground:(BGRAVideoFrame) frame;
-(void) setTransformationList:(const std::vector<Transformation>&) transformations;

@end